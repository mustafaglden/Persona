//
//  UserListRequest.swift
//  Persona
//
//  Created by Mustafa on 2.02.2025.
//


struct UserListRequest: Request {
    typealias E = [UserListResponseModel]

    let method: HTTPMethod = .get
}
