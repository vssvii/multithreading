//
//  PhotosViewController.swift
//  Navigation_2
//
//  Created by Ibragim Assaibuldayev on 07.06.2022.
//

import UIKit
import iOSIntPackage
import Foundation
import SnapKit



class PhotosViewController: UIViewController, UINavigationBarDelegate {
    
    var imagePublisherFacade = ImagePublisherFacade()
    
    let imageProcessor = ImageProcessor()
    
    private var publisherImages: [UIImage] = []
    
    deinit {
        imagePublisherFacade.rechargeImageLibrary()
        imagePublisherFacade.removeSubscription(for: self)
    }
    
    let loginInfo = LogInViewController(inspector: factory)
    
    private enum CellReuseIdentifiers: String {
        case photos
        case collection
    }
    
    lazy var photoCollectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let photoCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: viewLayout)
        photoCollectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: CellReuseIdentifiers.photos.rawValue)
        photoCollectionView.translatesAutoresizingMaskIntoConstraints = false
        photoCollectionView.backgroundColor = .white
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        photoCollectionView.reloadData()
        return photoCollectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.title = "Галерея"
        
        setupViews()
        setupLayouts()
        
        self.navigationController?.navigationBar.isHidden = false

        imagePublisherFacade.subscribe(self)
        
        imagePublisherFacade.addImagesWithTimer(time: 0.1, repeat: 10)
        
        receive(images: dataPhotosSafely)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setupViews() {
        
        view.addSubview(photoCollectionView)
    }
    
    private func setupLayouts() {
        
        NSLayoutConstraint.activate([
            
            photoCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photoCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            photoCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            photoCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return publisherImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellReuseIdentifiers.photos.rawValue, for: indexPath) as! PhotosCollectionViewCell
                cell.photoImageView.image = publisherImages[indexPath.row]
                return cell
    }
}


extension PhotosViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: (view.frame.size.width/3)-3,
            height: (view.frame.size.width/3)-3)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.8, left: 1, bottom: -8.0, right: -1)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

extension PhotosViewController: ImageLibrarySubscriber {
    
    func receive(images: [UIImage]) {
        let startTime = CFAbsoluteTimeGetCurrent()
        self.imageProcessor.processImagesOnThread(sourceImages: images, filter: .chrome, qos: .utility, completion: { images in
            DispatchQueue.main.async {
                images.forEach {
                    guard let img = $0 else { return }
                    self.publisherImages.append(UIImage(cgImage: img))
                }
                let finishTime = CFAbsoluteTimeGetCurrent()
                var time = finishTime - startTime
                print("time: \(time)")
                self.photoCollectionView.reloadData()
                // when filter: .chrome, qos: .utility – time: 25.908015966415405
                // when filter: .noir, qos: .utility – time: 36.0049329996109
                // when filter: .chrome, qos: .background – time: 115.93350791931152
                // when filter: .chrome, qos: .userInitiated – time: 39.15327799320221
            }
        })
    }
}

// 
