//
//  UserDetailViewController.swift
//  Persona
//
//  Created by Mustafa on 2.02.2025.
//

import UIKit

final class UserDetailViewController: BaseViewController {
    
    private let user: UserListResponseModel
    private let nameLabel = UILabel()
    private let emailLabel = UILabel()
    private let phoneLabel = UILabel()
    private let websiteLabel = UILabel()

    init(user: UserListResponseModel) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .snowGray
        titleLabelText = user.name
        setupViews()
        configure()
    }
    
    private func setupViews() {
        nameLabel.font = UIFont.boldSystemFont(ofSize: 22)
        emailLabel.font = UIFont.systemFont(ofSize: 18)
        phoneLabel.font = UIFont.systemFont(ofSize: 18)
        websiteLabel.font = UIFont.systemFont(ofSize: 18)
        
        nameLabel.textColor = .burgundy
        emailLabel.textColor = .lightBurgundy
        phoneLabel.textColor = .lightBurgundy
        websiteLabel.textColor = .blue
        
        websiteLabel.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openWebsite))
        websiteLabel.addGestureRecognizer(tapGesture)
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, emailLabel, phoneLabel, websiteLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func configure() {
        nameLabel.text = user.name
        emailLabel.text = "📧 \(user.email)"
        phoneLabel.text = "📞 \(user.phone)"
        websiteLabel.text = "🌐 \(user.website)"
    }
    
    @objc private func openWebsite() {
        if let url = URL(string: "https://\(user.website)") {
            UIApplication.shared.open(url)
        }
    }
}
