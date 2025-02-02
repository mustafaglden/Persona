//
//  UserListViewModel.swift
//  Persona
//
//  Created by Mustafa on 2.02.2025.
//

import Foundation

final class UserListViewModel {
    private var allUsers: [UserListResponseModel] = []
    let networking: NetworkManager

    var users: [UserListResponseModel] {
        return allUsers
    }
    
    init(networking: NetworkManager = Networking()) {
        self.networking = networking
    }
    
    func loadAllUsers() async {
        do {
            let request = UserListRequest()
            let response = try await networking.makeRequest(request)
            await MainActor.run {
                self.allUsers = response // Update the users list
            }
        } catch {
            print("Error fetching users: \(error.localizedDescription)")
        }
    }
}
