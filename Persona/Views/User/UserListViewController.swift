//
//  UserListViewController.swift
//  Persona
//
//  Created by Mustafa on 2.02.2025.
//

import UIKit

/// This class is responsible for displaying a list of users in a collection view
final class UserListViewController: BaseViewController {
    
    private let viewModel: UserListViewModel
    private var collectionView: UICollectionView!

    init(viewModel: UserListViewModel = UserListViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Called when the view is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabelText = "User List"
        
        setupCollectionView()
        setupViewModel()
        loadUsers()
    }

    /// Function to set up the collection view
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width - 32, height: 100)
        layout.minimumLineSpacing = 16
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(named: "snowGrayColor")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UserCollectionViewCell.self, forCellWithReuseIdentifier: "UserCell")
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    /// Function to set up the ViewModel's bindings
    private func setupViewModel() {
        viewModel.onUsersUpdated = { [weak self] in
            self?.collectionView.reloadData()
        }
    }

    /// Function to load users using async API call
    private func loadUsers() {
        Task {
            await viewModel.loadAllUsers()
        }
    }
}

// MARK: - UICollectionViewDataSource
/// Conforming to UICollectionViewDataSource to manage data for the collection view
extension UserListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as? UserCollectionViewCell else {
            return UICollectionViewCell()
        }
        let user = viewModel.users[indexPath.item]
        cell.configure(with: user)
        cell.backgroundColor = .lightBurgundy
        return cell
    }
}

// MARK: - UICollectionViewDelegate
/// Conforming to UICollectionViewDelegate to handle cell taps
extension UserListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let user = viewModel.users[indexPath.item]
        let detailVC = UserDetailViewController(user: user)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
