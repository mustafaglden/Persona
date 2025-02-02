//
//  MockUserRepository.swift
//  Persona
//
//  Created by Mustafa on 2.02.2025.
//

import Foundation
@testable import Persona

final class MockUserRepository: UserRepositoryProtocol {
    
    var shouldReturnError = false
    
    func fetchAllUsers() async throws -> [UserListResponseModel] {
        if shouldReturnError {
            throw NSError(domain: "TestError", code: 500, userInfo: nil)
        }
        
        return [
            UserListResponseModel(
                id: 1,
                name: "John Doe",
                username: "Bret",
                email: "john@example.com",
                address: Address(
                    street: "Kulas Light",
                    suite: "Apt. 556",
                    city: "Gwenborough",
                    zipcode: "92998-3874",
                    geo: Geo(
                        lat: "-37.3159",
                        lng: "81.1496"
                    )
                ),
                phone: "1-770-736-8031 x56442",
                website: "hildegard.org",
                company: Company(
                    name: "Romaguera-Crona",
                    catchPhrase: "Multi-layered client-server neural-net",
                    bs: "harness real-time e-markets"
                )
            ),
            UserListResponseModel(
                id: 2,
                name: "John Doe",
                username: "Bret",
                email: "john@example.com",
                address: Address(
                    street: "Kulas Light",
                    suite: "Apt. 556",
                    city: "Gwenborough",
                    zipcode: "92998-3874",
                    geo: Geo(
                        lat: "-37.3159",
                        lng: "81.1496"
                    )
                ),
                phone: "1-770-736-8031 x56442",
                website: "hildegard.org",
                company: Company(
                    name: "Romaguera-Crona",
                    catchPhrase: "Multi-layered client-server neural-net",
                    bs: "harness real-time e-markets"
                )
            ),
        ]
    }
}
