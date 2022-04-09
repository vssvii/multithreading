//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Ibragim Assaibuldayev on 05.12.2021.
//

import UIKit


class ProfileViewController: UIViewController {
    
    struct Post {
        let author: String
        let description: String
        let image: UIImage?
        let likes: Int
        let views: Int
    }
    
    var posts: [Post] = []
    
    var post1 = Post(author: "Димаш Кудайберген", description: "концерт в Москве", image: UIImage(named: "dimash"), likes: 150, views: 200)
    var post2 = Post (author: "Elon Musk", description: "Waiting to launch global wi-fi", image: UIImage(named: "starlink"), likes: 400, views: 450)
    var post3 = Post(author: "Мотивация. Спорт", description: "Программа по отжиманиям", image: UIImage(named: "pushups"), likes: 150, views: 180)
    
    private lazy var tableViewM: UITableView = {
        let tableViewM = UITableView(frame: .zero, style: .grouped)
        tableViewM.translatesAutoresizingMaskIntoConstraints = false
        return tableViewM
    }()
    
    private var profileView: UIView = {
        let profileView = ProfileHeaderView()
        profileView.translatesAutoresizingMaskIntoConstraints = false
        return profileView
    }()
    
    private enum CellReuseIdentifiers: String {
        case animal
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        posts.append(post1)
        posts.append(post2)
        posts.append(post3)
        
        view.backgroundColor = .white
        
        view.addSubview(tableViewM)
        
        
        NSLayoutConstraint.activate([
            tableViewM.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableViewM.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableViewM.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableViewM.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        tableViewM.register(PostTableViewCell.self, forCellReuseIdentifier: CellReuseIdentifiers.animal.rawValue)
        
        tableViewM.tableFooterView = UIView()
        
        tableViewM.dataSource = self
        tableViewM.delegate = self
        
        tableViewM.tableHeaderView = profileView
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let indexPath = tableViewM.indexPathForSelectedRow else { return
        }
        tableViewM.deselectRow(at: indexPath, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        sizeHeaderToFit()
    }

    private func sizeHeaderToFit() {
        let headerView = tableViewM.tableHeaderView!

        headerView.setNeedsLayout()
        headerView.layoutIfNeeded()

        let height = headerView.systemLayoutSizeFitting(ProfileHeaderView.layoutFittingCompressedSize).height
        var frame = headerView.frame
        frame.size.height = height
        headerView.frame = frame

        tableViewM.tableHeaderView = headerView
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell: PostTableViewCell = tableView.dequeueReusableCell(
//            withIdentifier: CellReuseIdentifiers.animal.rawValue,
//            for: indexPath
//        ) as? PostTableViewCell else {
//            fatalError()
//        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseIdentifiers.animal.rawValue, for: indexPath) as! PostTableViewCell
        cell.authorLabel.text = posts[indexPath.row].author
        cell.descriptionLabel.text = posts[indexPath.row].description
        cell.likesLabel.text = String(posts[indexPath.row].likes)
        cell.viewsLabel.text = String(posts[indexPath.row].views)
        cell.postView.image = posts[indexPath.row].image
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = ProfileHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 150))
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 420
    }
    
    func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) -> ProfileHeaderView {
        return ProfileHeaderView()
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        print("Did select cell at \(indexPath)")
        
        let data = posts[indexPath.row]
    }
}
