//
//  UserRepositoryProtocol.swift
//  Persona
//
//  Created by Mustafa on 2.02.2025.
//

import Foundation

protocol UserRepositoryProtocol {
    func fetchAllUsers() async throws -> [UserListResponseModel]
}
