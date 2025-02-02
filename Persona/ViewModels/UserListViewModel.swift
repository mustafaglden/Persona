//
//  UserListViewModel.swift
//  Persona
//
//  Created by Mustafa on 2.02.2025.
//

import Foundation

final class UserListViewModel {
    
    private let repository: UserRepositoryProtocol
    var users: [UserListResponseModel] = []
    
    var onUsersUpdated: (() -> Void)?

    init(repository: UserRepositoryProtocol = UserRepository()) {
        self.repository = repository
    }
    
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
