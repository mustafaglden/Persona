//
//  NetworkingTests.swift
//  Persona
//
//  Created by Mustafa on 2.02.2025.
//


import XCTest
@testable import Persona

final class NetworkingTests: XCTestCase {

    func testMakeRequestSuccess() async throws {
        let networking = Networking()
        let request = UserListRequest()
        
        do {
            let users = try await networking.makeRequest(request)
            XCTAssertFalse(users.isEmpty)
        } catch {
            XCTFail("Request failed with error: \(error)")
        }
    }
}
