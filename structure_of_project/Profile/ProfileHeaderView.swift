//
//  ProfileHeaderView.swift
//  Navigation_2
//
//  Created by Ibragim Assaibuldayev on 18.01.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    public var statusText: String?
    
    private var statusLabel: UILabel = {
       let statusLabel = UILabel()
        statusLabel.textAlignment = .center
        statusLabel.font = .boldSystemFont(ofSize: 14)
        statusLabel.textColor = .gray
        statusLabel.text = "Напишите статус"
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()
    
    private var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.image = UIImage(named: "profile")
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.cornerRadius = 50
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        return avatarImageView
    }()
    
    private var setStatusButton: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.backgroundColor = .blue
        setStatusButton.setTitle("Показать статус", for: .normal)
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        return setStatusButton
    }()
    
    private var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Ibragim"
        fullNameLabel.font = .boldSystemFont(ofSize: 18)
        fullNameLabel.textAlignment = .center
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return fullNameLabel
    }()
        
    private var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.backgroundColor = .white
        statusTextField.textColor = .black
        statusTextField.font = .boldSystemFont(ofSize: 15)
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        statusTextField.keyboardAppearance = .default
        statusTextField.keyboardType = .default
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        return statusTextField
    }()
    
    private var closeButton: UIButton = {
        let closeButton = UIButton()
        closeButton.setTitle("Закрыть", for: .normal)
        closeButton.backgroundColor = .systemRed
        closeButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        closeButton.layer.shadowRadius = 3
        closeButton.layer.shadowColor = UIColor.black.cgColor
        closeButton.layer.shadowOpacity = 0.9
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        return closeButton
    }()
    
    override func draw(_ rect: CGRect) {
        guard let ctx = UIGraphicsGetCurrentContext() else {
            return
        }
        self.addSubview(avatarImageView)
        self.addSubview(setStatusButton)
        self.addSubview(fullNameLabel)
        self.addSubview(statusTextField)
        self.addSubview(statusLabel)
        self.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16.0),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0),
            avatarImageView.widthAnchor.constraint(equalToConstant: 110),
            avatarImageView.heightAnchor.constraint(equalToConstant: 110)
        ])
        
        NSLayoutConstraint.activate([
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.safeAreaLayoutGuide.bottomAnchor, constant: 16.0),
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0),
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50.0)
        ])
        
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: -27.0),
            fullNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            fullNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            fullNameLabel.widthAnchor.constraint(equalToConstant: 120),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        NSLayoutConstraint.activate([
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -16.0),
            statusTextField.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 16.0),
            statusTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16.0),
            statusTextField.heightAnchor.constraint(equalToConstant: 40.0)
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: 16),
            statusLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            statusLabel.bottomAnchor.constraint(equalTo: statusTextField.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            closeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            closeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            closeButton.heightAnchor.constraint(equalToConstant: 50.0),
            closeButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    @objc func statusTextChanged(_ textField: UITextField) -> String? {
        statusText = textField.text
        return statusText
    }
    
    @objc func buttonPressed() {
        statusLabel.text = statusText
    }
}


