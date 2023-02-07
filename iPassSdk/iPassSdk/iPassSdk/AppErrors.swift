//  AppErrors.swift
//  Created by CS on 24/01/23.

import Foundation

// MARK: - AppErrors
public enum AppErrors : String {
    case somethingWrong
    case internetConnection
    case sessionExpire
}

extension AppErrors {
    public var localizedDescription : String {
        switch self {
        case .somethingWrong : return "Something went wrong"
        case .internetConnection : return "The Internet connection appears to be offline."
        case .sessionExpire : return "Session Expire, Please Relogin"
        }
    }
}


