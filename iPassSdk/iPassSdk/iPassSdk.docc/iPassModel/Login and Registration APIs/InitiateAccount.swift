//  InitiateAccount.swift
//  Created by CS on 24/01/23.

import Foundation

// MARK: - InitiateAccountModel
struct InitiateAccountModel: Codable {
    let status: Bool?
    let message: String?
    let data: InitiateAccountClass?
}

// MARK: - InitiateAccountClass
struct InitiateAccountClass: Codable {
    let accdata: Accdata?
}

// MARK: - Accdata
struct Accdata: Codable {
    let timestamp: String?
    let account: Account?
    let web: Web?
    let sdk: SDK?
    let workflowExecution: WorkflowExecution?
}

// MARK: - Account
struct Account: Codable {
    let id: String?
}

// MARK: - SDK
struct SDK: Codable {
    let token: String?
}

// MARK: - Web
struct Web: Codable {
    let href, successURL, errorURL: String?
    
    enum CodingKeys: String, CodingKey {
        case href
        case successURL = "successUrl"
        case errorURL = "errorUrl"
    }
}

// MARK: - WorkflowExecution
struct WorkflowExecution: Codable {
    let id: String?
    let credentials: [Credential]?
}

// MARK: - Credential
struct Credential: Codable {
    let id, category: String?
    let allowedChannels: [String]?
    let api: API?
}

// MARK: - API
struct API: Codable {
    let token: String?
    let parts: Parts?
    let workflowExecution: String?
}

// MARK: - Parts
struct Parts: Codable {
    let front, back, face: String?
}
