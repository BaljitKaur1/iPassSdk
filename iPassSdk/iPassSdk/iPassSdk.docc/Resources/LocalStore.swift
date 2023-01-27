//  LocalStore.swift
//  Created by CS on 25/01/23.

import Foundation

class LocalStore: NSObject {
    
    // MARK: - Shared Instance
    static var shared = LocalStore()
    
    // MARK: - Variables
    var authorizationKey = "authorizationKey"
    
    // MARK: - Computed Variables
    var authorization: String {
        get { return UserDefaults.standard.string(forKey: authorizationKey) ?? "" }
        set { UserDefaults.standard.set(newValue, forKey: authorizationKey) }
    }
}
