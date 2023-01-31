//  SocialMediaPhoneDataModel.swift
//  Created by CS on 25/01/23.

import Foundation

// MARK: - SocialMediaPhoneDataModel
struct SocialMediaPhoneDataModel: Codable {
    let status: Bool?
    let message: String?
    let data: SocialMediaPhoneWelcomeData?
}

// MARK: - SocialMediaPhoneWelcomeData
struct SocialMediaPhoneWelcomeData: Codable {
    let resParse: ResParse?
}

// MARK: - ResParse
struct ResParse: Codable {
    let success: Bool?
    let error: Error?
    let data: ResParseData?
}

// MARK: - ResParseData
struct ResParseData: Codable {
    let number: Int?
    let valid, disposable: Bool?
    let type, country, carrier: String?
    let score: Int?
    let accountDetails: AccountDetails?
    let appliedRules: [AppliedRule]?
    
    enum CodingKeys: String, CodingKey {
        case number, valid, disposable, type, country, carrier, score
        case accountDetails = "account_details"
        case appliedRules = "applied_rules"
    }
}

// MARK: - AccountDetails
struct AccountDetails: Codable {
    let facebook: Bukalapak?
    let google: Google?
    let twitter, instagram, yahoo, microsoft: Bukalapak?
    let snapchat: Bukalapak?
    let skype: Skype?
    let whatsapp, telegram, viber: Telegram?
    let kakao: Bukalapak?
    let ok: Ok?
    let zalo: Zalo?
    let line: Line?
    let flipkart, bukalapak, jdid: Bukalapak?
}

// MARK: - Bukalapak
struct Bukalapak: Codable {
    let registered: Bool?
}

// MARK: - Google
struct Google: Codable {
    let registered: Bool?
    let accountID, fullName: JSONNull?
    
    enum CodingKeys: String, CodingKey {
        case registered
        case accountID = "account_id"
        case fullName = "full_name"
    }
}

// MARK: - Line
struct Line: Codable {
    let registered, name, photo: JSONNull?
}

// MARK: - Ok
struct Ok: Codable {
    let registered: Bool?
    let age: JSONNull?
}

// MARK: - Skype
struct Skype: Codable {
    let registered: Bool?
    let age: Int?
    let city: String?
    let bio: JSONNull?
    let country: String?
    let gender: Int?
    let language: JSONNull?
    let name, handle, id: String?
    let photo: String?
    let state: String?
}

// MARK: - Telegram
struct Telegram: Codable {
    let registered: Bool?
    let photo: String?
    let lastSeen: JSONNull?
    let name: JSONNull?
    let about: String?
    
    enum CodingKeys: String, CodingKey {
        case registered, photo
        case lastSeen = "last_seen"
        case name, about
    }
}

// MARK: - Zalo
struct Zalo: Codable {
    let registered: Bool?
    let dateOfBirth, name, uid: JSONNull?
    
    enum CodingKeys: String, CodingKey {
        case registered
        case dateOfBirth = "date_of_birth"
        case name, uid
    }
}

// MARK: - AppliedRule
struct AppliedRule: Codable {
    let id, name, operation: String?
    let score: Int?
}

// MARK: - Error
struct Error: Codable {
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
