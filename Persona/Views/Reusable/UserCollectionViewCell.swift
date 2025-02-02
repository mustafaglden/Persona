//
//  UserCollectionViewCell.swift
//  Persona
//
//  Created by Mustafa on 2.02.2025.
//

import UIKit

/// Custom collection view cell to display user details.
final class UserCollectionViewCell: UICollectionViewCell {
    
    private let nameLabel = UILabel()
    private let emailLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Sets up the cell UI.
    private func setupViews() {
        layer.cornerRadius = 8
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1
        clipsToBounds = true
        
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        nameLabel.textColor = .burgundy
        emailLabel.font = UIFont.systemFont(ofSize: 14)
        emailLabel.textColor = .snowWhite
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, emailLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    /// Configures the cell with user data.
    func configure(with user: UserListResponseModel) {
        nameLabel.text = user.name
        emailLabel.text = user.email
    }
}
