// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let tokenErrorModel = try? JSONDecoder().decode(TokenErrorModel.self, from: jsonData)

import Foundation

// MARK: - TokenErrorModel
struct TokenErrorModel: Codable {
    let status: Bool
    let message: String
    let error: Error
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
}

// MARK: - Error
struct Error: Codable {
    let bdy: Bdy
}

// MARK: - Bdy
struct Bdy: Codable {
    let type, title, status, detail: String
    let instance: String
}
