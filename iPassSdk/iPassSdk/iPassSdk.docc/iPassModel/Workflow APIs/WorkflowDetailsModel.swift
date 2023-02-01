// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let workflowDetailsModel = try? JSONDecoder().decode(WorkflowDetailsModel.self, from: jsonData)

import Foundation

// MARK: - WorkflowDetailsModel
struct WorkflowDetailsModel: Codable {
    let status: Bool
    let message: String
    let data: WorkflowDetailsModelData
}

// MARK: - WorkflowDetailsModelData
struct WorkflowDetailsModelData: Codable {
    let parseBody: ParseBody
}

// MARK: - ParseBody
struct ParseBody: Codable {
    let workflow: Workflow
    let account: Account
    let createdAt: String
    let credentials: [Credential]
    let steps: Steps
    let capabilities: Capabilities
    let issupadmin, sessionsid, pubprivkey, email: String
}

// MARK: - Account
struct Account: Codable {
    let id: String
}

// MARK: - Capabilities
struct Capabilities: Codable {
    let extraction, similarity: [Extraction]
    let liveness, dataChecks, imageChecks: [DataCheck]
    let usability: [Usability]
}

// MARK: - DataCheck
struct DataCheck: Codable {
    let id: String
    let credentials: [Credential]
}

// MARK: - Credential
struct Credential: Codable {
    let id: String
    let category: Category
}

enum Category: String, Codable {
    case facemap = "FACEMAP"
    case id = "ID"
    case selfie = "SELFIE"
}

// MARK: - Extraction
struct Extraction: Codable {
    let id: String
    let credentials: [Credential]
    let data: ExtractionData
}

// MARK: - ExtractionData
struct ExtractionData: Codable {
}

// MARK: - Usability
struct Usability: Codable {
    let id: String
    let credentials: [Credential]
    let decision: Decision?
}

// MARK: - Decision
struct Decision: Codable {
    let type: String
    let details: Details
}

// MARK: - Details
struct Details: Codable {
    let label: String
}

// MARK: - Steps
struct Steps: Codable {
    let href: String
}

// MARK: - Workflow
struct Workflow: Codable {
    let id, status, definitionKey, userReference: String
    let customerInternalReference: String
}
