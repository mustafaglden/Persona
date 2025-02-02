//
//  UserListViewModel.swift
//  Persona
//
//  Created by Mustafa on 2.02.2025.
//

import Foundation

/// ViewModel for managing user list data.
final class UserListViewModel {
    
    private let repository: UserRepositoryProtocol
    var users: [UserListResponseModel] = []
    
    /// Callback triggered when users are updated.
    var onUsersUpdated: (() -> Void)?

    /// Initializes with a user repository.
    init(repository: UserRepositoryProtocol = UserRepository()) {
        self.repository = repository
    }
    
    /// Loads all users from the repository.
    func loadAllUsers() async {
        do {
            let fetchedUsers = try await repository.fetchAllUsers()
            DispatchQueue.main.async {
                self.users = fetchedUsers
                self.onUsersUpdated?()
            }
        } catch {
            print("Error fetching users: \(error.localizedDescription)")
        }
    }
}
