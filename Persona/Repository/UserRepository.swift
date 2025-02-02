//
//  UserRepository.swift
//  Persona
//
//  Created by Mustafa on 2.02.2025.
//

import Foundation

final class UserRepository: UserRepositoryProtocol {
    
    private let networking: NetworkManager
    
    init(networking: NetworkManager = Networking()) {
        self.networking = networking
    }
    
    func fetchAllUsers() async throws -> [UserListResponseModel] {
        let request = UserListRequest()
        return try await networking.makeRequest(request)
    }
}
