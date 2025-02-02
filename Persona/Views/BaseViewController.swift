//
//  BaseViewController.swift
//  Persona
//
//  Created by Mustafa on 2.02.2025.
//

import UIKit

/// This class is a base view controller that provides a custom title and appearance for the navigation bar
class BaseViewController: UIViewController {
    let navTitleLabel = UILabel()
    let titleView = UIView()
    
    
    var titleLabelText: String = "" {
        didSet {
            updateCustomTitleView() // Update the title label when the text changes
        }
    }
    
    /// Called when the view is loaded
    override func viewDidLoad() {
        super.viewDidLoad()

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "burgundy")
        
        let backImage = UIImage(systemName: "arrow.backward")
        appearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)
        
        appearance.titleTextAttributes = [.foregroundColor: UIColor.snowWhite]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = UIColor(named: "snowWhiteColor")
        navigationItem.backButtonTitle = ""
        setupCustomTitleView()
    }

    /// Function to set up the custom title view
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
    
    /// Function to update the text of the title label when the title changes
    private func updateCustomTitleView() {
        navTitleLabel.text = titleLabelText
    }
}
