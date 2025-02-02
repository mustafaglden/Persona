//
//  UserRepository.swift
//  Persona
//
//  Created by Mustafa on 2.02.2025.
//

import Foundation

/// Handles user data fetching from the API.
final class UserRepository: UserRepositoryProtocol {
    
    private let networking: NetworkManager
    
    /// Initializes with a network manager.
    init(networking: NetworkManager = Networking()) {
        self.networking = networking
    }
    
    /// Fetches all users from the API.
    func fetchAllUsers() async throws -> [UserListResponseModel] {
        let request = UserListRequest()
        return try await networking.makeRequest(request)
    }
}
