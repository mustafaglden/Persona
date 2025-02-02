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

    override func setUp() {
        super.setUp()
        mockRepository = MockUserRepository()
        viewModel = UserListViewModel(repository: mockRepository)
    }

    override func tearDown() {
        viewModel = nil
        mockRepository = nil
        super.tearDown()
    }

    func testLoadAllUsersSuccess() async {
        let expectation = XCTestExpectation(description: "Users loaded successfully")
        
        viewModel.onUsersUpdated = {
            expectation.fulfill()
        }

        await viewModel.loadAllUsers()
        
        XCTAssertEqual(viewModel.users.count, 2)
        XCTAssertEqual(viewModel.users.first?.name, "John Doe")
        
        await fulfillment(of: [expectation], timeout: 1)
    }
    
    func testLoadAllUsersFailure() async {
        mockRepository.shouldReturnError = true
        await viewModel.loadAllUsers()
        
        XCTAssertTrue(viewModel.users.isEmpty)
    }
}
