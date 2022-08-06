//
//  FeedViewController.swift
//  Navigation
//
//  Created by Ibragim Assaibuldayev on 05.12.2021.
//

import UIKit
import Foundation

class WordModel: NSObject {
    
        let wordPassword: String = "пароль"
    
}

let wordModel = WordModel()

class FeedViewController: UIViewController {
    
    private var feedImageView: UIImageView = {
        let feedImageView = UIImageView()
        feedImageView.image = UIImage(named: "feedView")
        feedImageView.layer.borderColor = UIColor.white.cgColor
        feedImageView.clipsToBounds = true
        feedImageView.translatesAutoresizingMaskIntoConstraints = false
        return feedImageView
    }()
    
    private lazy var feedButton: CustomButton = {
        let feedButton = CustomButton(title: "Посмотреть пост", action: goToPostController)
        return feedButton
    }()
    
    @objc func goToPostController() {
        let postViewController = PostViewController()
        postViewController.modalPresentationStyle = .overCurrentContext
        self.navigationController?.pushViewController(postViewController, animated: true)
    }
    
    private lazy var feedTextField: UITextField = {
        let feedTextField = UITextField()
        feedTextField.layer.borderColor = UIColor.lightGray.cgColor
        feedTextField.layer.borderWidth = 0.5
        feedTextField.layer.cornerRadius = 10
        feedTextField.backgroundColor = .systemGray6
        feedTextField.textColor = .black
        feedTextField.font = .systemFont(ofSize: 16)
        feedTextField.autocapitalizationType = .none
        feedTextField.autocorrectionType = UITextAutocorrectionType.no
        feedTextField.keyboardType = UIKeyboardType.default
        feedTextField.returnKeyType = UIReturnKeyType.done
        feedTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        feedTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        feedTextField.translatesAutoresizingMaskIntoConstraints = false
        return feedTextField
    }()
    
    private lazy var checkButton: CustomButton = {
        let checkButton = CustomButton(title: "Проверить слово") { [unowned self] in
            guard let word = feedTextField.text else { return }
            check(word: word)
        }
        return checkButton
    }()
    
    func check(word: String) {
        if wordModel.wordPassword == word {
            feedTextField.textColor = .green
        } else {
            feedTextField.textColor = .red
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupLayout()
    }
    
    func setupLayout() {
        view.addSubview(feedImageView)
        view.addSubview(feedButton)
        view.addSubview(feedTextField)
        view.addSubview(checkButton)
        
        NSLayoutConstraint.activate([
            feedImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            feedImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            feedImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            
            feedButton.topAnchor.constraint(equalTo: feedImageView.safeAreaLayoutGuide.bottomAnchor, constant: 16.0),
            feedButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            feedButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            feedButton.heightAnchor.constraint(equalToConstant: 50.0),
            
            feedTextField.topAnchor.constraint(equalTo: feedButton.safeAreaLayoutGuide.bottomAnchor, constant: 32.0),
            feedTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            feedTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            feedTextField.heightAnchor.constraint(equalToConstant: 50.0),
            
            checkButton.topAnchor.constraint(equalTo: feedTextField.safeAreaLayoutGuide.bottomAnchor, constant: 16.0),
            checkButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            checkButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            checkButton.heightAnchor.constraint(equalToConstant: 50.0)
        ])
    }

    struct Post {
    var title: String
    }
    
    var post = Post(title: "Пост")
}
