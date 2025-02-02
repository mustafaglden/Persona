//
//  UserListViewModelTests.swift
//  Persona
//
//  Created by Mustafa on 2.02.2025.
//

import XCTest
@testable import Persona

final class UserListViewModelTests: XCTestCase {

    var viewModel: UserListViewModel!
    var mockRepository: MockUserRepository!

    /// Set up the test environment
    override func setUp() {
        super.setUp()
        // Initializing the mock repository and view model
        mockRepository = MockUserRepository()
        viewModel = UserListViewModel(repository: mockRepository)
    }

    /// Tear down after each test
    override func tearDown() {
        viewModel = nil
        mockRepository = nil
        super.tearDown()
    }

    /// Test case for successfully loading users
    func testLoadAllUsersSuccess() async {
        // Creating an expectation to wait for the async callback
        let expectation = XCTestExpectation(description: "Users loaded successfully")
        
        viewModel.onUsersUpdated = {
            expectation.fulfill()
        }

        await viewModel.loadAllUsers()
        
        XCTAssertEqual(viewModel.users.count, 2)
        XCTAssertEqual(viewModel.users.first?.name, "John Doe")
        
        // Wait for the async operation to complete
        await fulfillment(of: [expectation], timeout: 1)
    }
    
    /// Test case for failing to load users
    func testLoadAllUsersFailure() async {
        // Simulating an error scenario
        mockRepository.shouldReturnError = true
        await viewModel.loadAllUsers()
        
        XCTAssertTrue(viewModel.users.isEmpty)
    }
}
