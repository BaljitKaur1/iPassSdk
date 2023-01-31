// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let workflowDetailsModel = try? JSONDecoder().decode(WorkflowDetailsModel.self, from: jsonData)

import Foundation

// MARK: - WorkflowDetailsModel
struct WorkflowDetailsModel: Codable {
    let parseBody: ParseBody
}

// MARK: - ParseBody
struct ParseBody: Codable {
    let workflow: Workflow
    let account: Account
    let createdAt, startedAt, completedAt: String
    let credentials: [ParseBodyCredential]
    let decision: ParseBodyDecision
    let steps: Steps
    let capabilities: Capabilities
}

// MARK: - Account
struct Account: Codable {
    let id: String
}

// MARK: - Capabilities
struct Capabilities: Codable {
    let extraction, similarity: [DataCheck]
    let liveness: [Liveness]
    let dataChecks, imageChecks, usability: [DataCheck]
}

// MARK: - DataCheck
struct DataCheck: Codable {
    let id: String
    let credentials: [DataCheckCredential]
    let decision: DataCheckDecision
    let data: DataCheckData?
}

// MARK: - DataCheckCredential
struct DataCheckCredential: Codable {
    let id: String
    let category: Category
}

enum Category: String, Codable {
    case facemap = "FACEMAP"
    case id = "ID"
    case selfie = "SELFIE"
}

// MARK: - DataCheckData
struct DataCheckData: Codable {
    let type, subType, issuingCountry, firstName: String?
    let lastName, dateOfBirth, expiryDate, documentNumber: String?
    let optionalMrzField1, nationality, currentAge: String?
    let faceSearchFindings: FaceSearchFindings?
    let similarity: String?
}

// MARK: - FaceSearchFindings
struct FaceSearchFindings: Codable {
    let status: String
    let findings: [String]
}

// MARK: - DataCheckDecision
struct DataCheckDecision: Codable {
    let type: String
    let details: Details
}

// MARK: - Details
struct Details: Codable {
    let label: String
}

// MARK: - Liveness
struct Liveness: Codable {
    let id: String
    let validFaceMapForAuthentication: String
    let credentials: [DataCheckCredential]
    let decision: DataCheckDecision
    let data: LivenessData
}

// MARK: - LivenessData
struct LivenessData: Codable {
    let type: String
    let predictedAge: Int
    let ageConfidenceRange: String
}

// MARK: - ParseBodyCredential
struct ParseBodyCredential: Codable {
    let id: String
    let category: Category
    let parts: [Part]
}

// MARK: - Part
struct Part: Codable {
    let classifier: String
    let href: String?
}

// MARK: - ParseBodyDecision
struct ParseBodyDecision: Codable {
    let type: String
    let details: Details
    let risk: Risk
}

// MARK: - Risk
struct Risk: Codable {
    let score: Int
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

