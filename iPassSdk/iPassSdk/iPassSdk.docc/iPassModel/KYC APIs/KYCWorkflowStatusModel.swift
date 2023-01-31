//  KYCWorkflowStatusModel.swift
//  Created by CS on 25/01/23.

import Foundation

// MARK: - KYCWorkflowStatusModel
struct KYCWorkflowStatusModel: Codable {
    let status: Bool?
    let message: String?
    let data: KYCWorkflowStatusDataClass?
}

// MARK: - KYCWorkflowStatusDataClass
struct KYCWorkflowStatusDataClass: Codable {
    let statusParse: StatusParse?
}

// MARK: - StatusParse
struct StatusParse: Codable {
    let account: Account?
    let workflowExecution: WorkflowExecution?
}

// MARK: - Account
struct Account: Codable {
    let id: String?
    let href: String?
}

// MARK: - WorkflowExecution
struct WorkflowExecution: Codable {
    let id: String?
    let href: String?
    let definitionKey, status: String?
}
