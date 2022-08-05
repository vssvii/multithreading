//
//  PostViewController.swift
//  Navigation
//
//  Created by Ibragim Assaibuldayev on 08.12.2021.
//

import UIKit

class PostViewController: UIViewController {
    
//    private let viewModel: FeedModel
    
    weak var coordinator: PostViewController?
    
    var backgroundColor: UIColor = .clear
    
    init(_ color: UIColor, title: String = "Post") {
        super.init(nibName: nil, bundle: nil)
        backgroundColor = color
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
//        let feedView = FeedViewController(viewModel: viewModel)
//        self.title = feedView.post.title
        
        configureItems()
    }
    
    func configureItems() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.fill"), style: .done, target: self, action: #selector(barButtonAction))
    }
    
    @objc func barButtonAction(sender: UIBarButtonItem!) {
        let infoViewController = InfoViewController()
        present(infoViewController, animated: true, completion: nil)
    }
    
    
}
