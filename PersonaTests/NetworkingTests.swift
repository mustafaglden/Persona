//
//  NetworkingTests.swift
//  Persona
//
//  Created by Mustafa on 2.02.2025.
//

import XCTest
@testable import Persona

final class NetworkingTests: XCTestCase {

    /// Test to verify a successful network request
    func testMakeRequestSuccess() async throws {
        let networking = Networking()
        let request = UserListRequest()
        
        do {
            // Making the network request and getting the users
            let users = try await networking.makeRequest(request)
            XCTAssertFalse(users.isEmpty)
        } catch {
            // If an error occurs, fail the test
            XCTFail("Request failed with error: \(error)")
        }
    }
}
