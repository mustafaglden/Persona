//
//  BaseViewController.swift
//  Persona
//
//  Created by Mustafa on 2.02.2025.
//

import UIKit

class BaseViewController: UIViewController {
    let navTitleLabel = UILabel()
    let titleView = UIView()
    
    
    var titleLabelText: String = "" {
        didSet {
            updateCustomTitleView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "burgundy")
        
        let backImage = UIImage(systemName: "arrow.backward")
        appearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = UIColor(named: "snowWhiteColor")
        navigationItem.backButtonTitle = ""
        setupCustomTitleView()
    }

    private func setupCustomTitleView() {
        titleView.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = UIColor(named: "snowGrayColor")
        
        navTitleLabel.text = titleLabelText
        navTitleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        navTitleLabel.textColor = .white
        navTitleLabel.textAlignment = .left
        navTitleLabel.translatesAutoresizingMaskIntoConstraints = false

        titleView.addSubview(navTitleLabel)

        NSLayoutConstraint.activate([
            navTitleLabel.leadingAnchor.constraint(equalTo: titleView.leadingAnchor),
            navTitleLabel.trailingAnchor.constraint(equalTo: titleView.trailingAnchor),
            navTitleLabel.topAnchor.constraint(equalTo: titleView.topAnchor),
            navTitleLabel.bottomAnchor.constraint(equalTo: titleView.bottomAnchor)
        ])
        
        navigationItem.titleView = titleView
    }
    
    private func updateCustomTitleView() {
        navTitleLabel.text = titleLabelText
    }
}
