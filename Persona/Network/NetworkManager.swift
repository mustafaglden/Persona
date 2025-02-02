//
//  NetworkManager.swift
//  Persona
//
//  Created by Mustafa on 2.02.2025.
//


protocol NetworkManager: AnyObject {
    func makeRequest<T: Request>(_ request: T) async throws -> T.E
}
