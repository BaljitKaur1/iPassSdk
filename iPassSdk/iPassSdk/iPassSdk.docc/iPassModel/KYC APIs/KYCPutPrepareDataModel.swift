//  KYCPutPrepareDataModel.swift
//  Created by CS on 25/01/23.

import Foundation

// MARK: - KYCPutPrepareDataModel
struct KYCPutPrepareDataModel: Codable {
    let status: Bool?
    let message: String?
    let data: KYCPutPrepareDataClass?
}

// MARK: - KYCPutPrepareDataClass
struct KYCPutPrepareDataClass: Codable {
    let resParse: ResParse?
}

// MARK: - ResParse
struct ResParse: Codable {
    let timestamp: String?
    let account, workflowExecution: Account?
}

// MARK: - Account
struct Account: Codable {
    let id: String?
}
