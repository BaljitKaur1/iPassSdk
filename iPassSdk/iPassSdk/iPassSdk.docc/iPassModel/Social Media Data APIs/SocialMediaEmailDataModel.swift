//  SocialMediaEmailDataModel.swift
//  Created by CS on 25/01/23.

import Foundation

// MARK: - SocialMediaEmailDataModel
struct SocialMediaEmailDataModel: Codable {
    let status: Bool?
    let message: String?
    let data: SocialMediaEmailWelcomeData?
}

// MARK: - SocialMediaEmailWelcomeData
struct SocialMediaEmailWelcomeData: Codable {
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
    let email: String?
    let score: Int?
    let deliverable: Bool?
    let domainDetails: DomainDetails?
    let accountDetails: AccountDetails?
    let breachDetails: BreachDetails?
    let appliedRules: [AppliedRule]?
    
    enum CodingKeys: String, CodingKey {
        case email, score, deliverable
        case domainDetails = "domain_details"
        case accountDetails = "account_details"
        case breachDetails = "breach_details"
        case appliedRules = "applied_rules"
    }
}

// MARK: - AccountDetails
struct AccountDetails: Codable {
    let apple, ebay: Adobe?
    let facebook: Facebook?
    let flickr: Flickr?
    let foursquare: Foursquare?
    let github: Adobe?
    let google: Google?
    let gravatar: Gravatar?
    let instagram, lastfm: Adobe?
    let linkedin: Linkedin?
    let microsoft, myspace, pinterest: Adobe?
    let skype: Skype?
    let spotify, tumblr, twitter, vimeo: Adobe?
    let weibo, yahoo, discord: Adobe?
    let ok: Ok?
    let kakao, booking: Adobe?
    let airbnb: Airbnb?
    let amazon, qzone, adobe, mailru: Adobe?
    let wordpress, imgur, disneyplus, netflix: Adobe?
    let jdid, flipkart, bukalapak, archiveorg: Adobe?
    let lazada, zoho, samsung, evernote: Adobe?
    let envato, patreon, tokopedia, rambler: Adobe?
    let quora, atlassian: Adobe?
}

// MARK: - Adobe
struct Adobe: Codable {
    let registered: Bool?
}

// MARK: - Airbnb
struct Airbnb: Codable {
    let registered, about, createdAt, firstName: JSONNull?
    let identityVerified, location, image, revieweeCount: JSONNull?
    let trips, work: JSONNull?
    
    enum CodingKeys: String, CodingKey {
        case registered, about
        case createdAt = "created_at"
        case firstName = "first_name"
        case identityVerified = "identity_verified"
        case location, image
        case revieweeCount = "reviewee_count"
        case trips, work
    }
}

// MARK: - Facebook
struct Facebook: Codable {
    let registered: Bool?
    let url, name, photo: JSONNull?
}

// MARK: - Flickr
struct Flickr: Codable {
    let registered: Bool?
    let username: JSONNull?
}

// MARK: - Foursquare
struct Foursquare: Codable {
    let registered: Bool?
    let bio: String?
    let photo: JSONNull?
    let profileURL: String?
    
    enum CodingKeys: String, CodingKey {
        case registered, bio, photo
        case profileURL = "profile_url"
    }
}

// MARK: - Google
struct Google: Codable {
    let registered: Bool?
    let photo: String?
}

// MARK: - Gravatar
struct Gravatar: Codable {
    let registered: Bool?
    let location, name: JSONNull?
    let profileURL: String?
    let username: String?
    
    enum CodingKeys: String, CodingKey {
        case registered, location, name
        case profileURL = "profile_url"
        case username
    }
}

// MARK: - Linkedin
struct Linkedin: Codable {
    let registered, url, name, company: JSONNull?
    let title, location, website, twitter: JSONNull?
    let photo, connectionCount: JSONNull?
    
    enum CodingKeys: String, CodingKey {
        case registered, url, name, company, title, location, website, twitter, photo
        case connectionCount = "connection_count"
    }
}

// MARK: - Ok
struct Ok: Codable {
    let registered: Bool?
    let city: String?
    let age, dateJoined: Int?
    
    enum CodingKeys: String, CodingKey {
        case registered, city, age
        case dateJoined = "date_joined"
    }
}

// MARK: - Skype
struct Skype: Codable {
    let registered: Bool?
    let country, city: String?
    let gender: Int?
    let name, id, handle, bio: String?
    let age: Int?
    let language: JSONNull?
    let state: String?
    let photo: String?
}

// MARK: - AppliedRule
struct AppliedRule: Codable {
    let id, name, operation: String?
    let score: Int?
}

// MARK: - BreachDetails
struct BreachDetails: Codable {
    let haveibeenpwnedListed: Bool?
    let numberOfBreaches: Int?
    let firstBreach: String?
    let breaches: [Breach]?
    
    enum CodingKeys: String, CodingKey {
        case haveibeenpwnedListed = "haveibeenpwned_listed"
        case numberOfBreaches = "number_of_breaches"
        case firstBreach = "first_breach"
        case breaches
    }
}

// MARK: - Breach
struct Breach: Codable {
    let name, domain, date: String?
}

// MARK: - DomainDetails
struct DomainDetails: Codable {
    let domain, tld: String?
    let registered: Bool?
    let created, updated, expires, registrarName: String?
    let registeredTo: String?
    let disposable, free, custom, dmarcEnforced: Bool?
    let spfStrict, validMX, acceptAll, suspiciousTLD: Bool?
    let websiteExists: Bool?
    
    enum CodingKeys: String, CodingKey {
        case domain, tld, registered, created, updated, expires
        case registrarName = "registrar_name"
        case registeredTo = "registered_to"
        case disposable, free, custom
        case dmarcEnforced = "dmarc_enforced"
        case spfStrict = "spf_strict"
        case validMX = "valid_mx"
        case acceptAll = "accept_all"
        case suspiciousTLD = "suspicious_tld"
        case websiteExists = "website_exists"
    }
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
