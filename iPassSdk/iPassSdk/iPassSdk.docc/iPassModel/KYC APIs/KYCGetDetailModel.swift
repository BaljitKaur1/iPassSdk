//  KYCGetDetailModel.swift
//  Created by CS on 25/01/23.

import Foundation

// MARK: - KYCGetDetailModel
struct KYCGetDetailModel: Codable {
    let status: Bool?
    let message: String?
    let data: WelcomeData?
}

// MARK: - WelcomeData
struct WelcomeData: Codable {
    let parseBody: ParseBody?
}

// MARK: - ParseBody
struct ParseBody: Codable {
    let workflow: Workflow?
    let account: Account?
    let createdAt, startedAt, completedAt: String?
    let credentials: [ParseBodyCredential]?
    let decision: ParseBodyDecision?
    let steps: Steps?
    let capabilities: Capabilities?
}

// MARK: - Account
struct Account: Codable {
    let id: String?
}

// MARK: - Capabilities
struct Capabilities: Codable {
    let watchlistScreening: [WatchlistScreening]?
}

// MARK: - WatchlistScreening
struct WatchlistScreening: Codable {
    let id: String?
    let credentials: [WatchlistScreeningCredential]?
    let decision: WatchlistScreeningDecision?
    let data: WatchlistScreeningData?
}

// MARK: - WatchlistScreeningCredential
struct WatchlistScreeningCredential: Codable {
    let id, category: String?
}

// MARK: - WatchlistScreeningData
struct WatchlistScreeningData: Codable {
    let searchDate, searchID, searchReference: String?
    let searchResultURL: String?
    let searchResults: Int?
    let searchStatus: String?

    enum CodingKeys: String, CodingKey {
        case searchDate
        case searchID = "searchId"
        case searchReference
        case searchResultURL = "searchResultUrl"
        case searchResults, searchStatus
    }
}

// MARK: - WatchlistScreeningDecision
struct WatchlistScreeningDecision: Codable {
    let type: String?
    let details: Details?
}

// MARK: - Details
struct Details: Codable {
    let label: String?
}

// MARK: - ParseBodyCredential
struct ParseBodyCredential: Codable {
    let id, category: String?
    let parts: [Part]?
}

// MARK: - Part
struct Part: Codable {
    let classifier: String
    let href: String?
}

// MARK: - ParseBodyDecision
struct ParseBodyDecision: Codable {
    let type: String?
    let details: Details?
    let risk: Risk?
}

// MARK: - Risk
struct Risk: Codable {
    let score: Int?
}

// MARK: - Steps
struct Steps: Codable {
    let href: String?
}

// MARK: - Workflow
struct Workflow: Codable {
    let id, status, definitionKey, customerInternalReference: String?
}
