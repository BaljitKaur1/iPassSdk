//  KYCPrepareDataModel.swift
//  Created by CS on 25/01/23.

import Foundation

// MARK: - KYCPrepareDataModel
struct KYCPrepareDataModel: Codable {
    let status: Bool?
    let message: String?
    let data: KYCPrepareDataClass?
}

// MARK: - KYCPrepareDataClass
struct KYCPrepareDataClass: Codable {
    let parseBody: ParseBody?
}

// MARK: - ParseBody
struct ParseBody: Codable {
    let timestamp: String?
    let account, workflowExecution: Account?
    let api: API?
}

// MARK: - Account
struct Account: Codable {
    let id: String?
}

// MARK: - API
struct API: Codable {
    let parts: Parts?
    let workflowExecution: String?
}

// MARK: - Parts
struct Parts: Codable {
}
