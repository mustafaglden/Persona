//
//  UserDetailViewController.swift
//  Persona
//
//  Created by Mustafa on 2.02.2025.
//

import UIKit

final class UserDetailViewController: BaseViewController {
    private let user: UserListResponseModel
    private let scrollView = UIScrollView()
    private let contentView = UIView()

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
        setupScrollView()
        setupContentView()
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupContentView() {
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
        
        stackView.addArrangedSubview(createSectionView(title: "Personal Information", items: [
            ("Name", user.name),
            ("Username", user.username),
            ("Email", "\(user.email)"),
            ("Phone", "\(user.phone)")
        ]))
        
        stackView.addArrangedSubview(createSectionView(title: "Address", items: [
            ("Street", user.address.street),
            ("Suite", user.address.suite),
            ("City", user.address.city),
            ("Zipcode", user.address.zipcode)
        ]))
        
        stackView.addArrangedSubview(createSectionView(title: "Geo Location", items: [
            ("Latitude", user.address.geo.lat),
            ("Longitude", user.address.geo.lng)
        ]))
        
        stackView.addArrangedSubview(createSectionView(title: "Company", items: [
            ("Name", user.company.name),
            ("Catch Phrase", user.company.catchPhrase),
            ("BS", user.company.bs)
        ]))
        
        let websiteLabel = createInteractiveLabel(text: "🌐 \(user.website)")
        websiteLabel.textColor = .systemBlue
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openWebsite))
        websiteLabel.addGestureRecognizer(tapGesture)
        stackView.addArrangedSubview(websiteLabel)
    }
    
    private func createSectionView(title: String, items: [(String, String)]) -> UIView {
        let sectionView = UIView()
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .burgundy
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        sectionView.addSubview(titleLabel)
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        sectionView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: sectionView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: sectionView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: sectionView.trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: sectionView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: sectionView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: sectionView.bottomAnchor)
        ])
        
        for (key, value) in items {
            let label = UILabel()
            let attributedString = NSMutableAttributedString(string: "\(key): ", attributes: [
                .foregroundColor: UIColor.burgundy,
                .font: UIFont.boldSystemFont(ofSize: 16)
            ])
            attributedString.append(NSAttributedString(string: value, attributes: [
                .foregroundColor: UIColor.label,
                .font: UIFont.systemFont(ofSize: 16)
            ]))
            label.attributedText = attributedString
            label.numberOfLines = 0
            stackView.addArrangedSubview(label)
        }
        
        return sectionView
    }

    private func createInteractiveLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.isUserInteractionEnabled = true
        return label
    }
    
    @objc private func openWebsite() {
        if let url = URL(string: "https://\(user.website)") {
            UIApplication.shared.open(url)
        }
    }
}

