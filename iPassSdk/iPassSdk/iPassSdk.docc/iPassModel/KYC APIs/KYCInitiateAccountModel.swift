//  KYCInitiateAccountModel.swift
//  Created by CS on 25/01/23.

import Foundation

// MARK: - KYCInitiateAccountModel
struct KYCInitiateAccountModel: Codable {
    let status: Bool?
    let message: String?
    let data: KYCInitiateAccountDataClass?
}

// MARK: - KYCInitiateAccountDataClass
struct KYCInitiateAccountDataClass: Codable {
    let bdy: Bdy?
}

// MARK: - Bdy
struct Bdy: Codable {
    let timestamp: String?
    let account: Account?
    let workflowExecution: WorkflowExecution?
}

// MARK: - Account
struct Account: Codable {
    let id: String?
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
    let preparedData: String?
    
    enum CodingKeys: String, CodingKey {
        case preparedData = "prepared_data"
    }
}

