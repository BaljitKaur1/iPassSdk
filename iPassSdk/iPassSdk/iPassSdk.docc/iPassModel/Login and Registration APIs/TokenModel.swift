//  TokenModel.swift
//  Created by CS on 24/01/23.

import Foundation

// MARK: - TokenModel
struct TokenModel: Codable {
    let status: Bool?
    let message: String?
    let data: TokenClass?
}

// MARK: - TokenClass
struct TokenClass: Codable {
    let user: TokenUser?
}

// MARK: - TokenUser
struct TokenUser: Codable {
    let firstName, lastName, email, password: String?
    let id: String?
    let v: Int?
    let token: String?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case email, password
        case id = "_id"
        case v = "__v"
        case token
    }
}
