//
//  UserListViewController.swift
//  Persona
//
//  Created by Mustafa on 2.02.2025.
//

import UIKit

final class UserListViewController: BaseViewController {
    
    private let viewModel = UserListViewModel()
    private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabelText = "User List"
        
        setupCollectionView()
        loadUsers()
    }
    
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
    
    private func loadUsers() {
        Task {
            await viewModel.loadAllUsers()
            await MainActor.run {
                self.collectionView.reloadData()
            }
        }
    }
}

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

extension UserListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let user = viewModel.users[indexPath.item]
        let detailVC = UserDetailViewController(user: user)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
