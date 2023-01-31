//  SocialMediaDataApis.swift
//  Created by CS on 25/01/23.

import UIKit
import Alamofire
import PKHUD

class SocialMediaDataApis : NSObject {
    
    // MARK: - Shared Instance
    static let shared = SocialMediaDataApis()
    
    // MARK: - Social Media Data APIs
    // Social Media Phone Data API
    func socialMediaPhoneDataApi(_ view: UIView, _ phone_number: String,  completion: @escaping(_ : SocialMediaPhoneDataModel) -> Void) {
        HUD.show(.progress, onView: view)
        
        var url = URLComponents(string: SocialMediaPhoneDataApi.baseApi)!
        url.queryItems = [
            URLQueryItem(name: Token.token, value: Token.basetoken)
        ]
        
        let socialMediaPhoneDataParams : [String: String] = [
            SocialMediaPhoneDataApi.phone_number              :       phone_number
        ]
        
        let headers : [String: String] = [
            "Authorization" : LocalStore.shared.authorization
        ]
        
        baseRequestApi(url, .get, socialMediaPhoneDataParams, headers) { (result: SocialMediaPhoneDataModel?) in
            print(result!)
            completion(result!)
        }
    }
    
    // Social Media Email Data API
    func socialMediaEmailDataApi(_ view: UIView, _ email: String,  completion: @escaping(_ : SocialMediaEmailDataModel) -> Void) {
        HUD.show(.progress, onView: view)
        
        var url = URLComponents(string: SocialMediaEmailDataApi.baseApi)!
        url.queryItems = [
            URLQueryItem(name: Token.token, value: Token.basetoken)
        ]
        
        let socialMediaEmailDataParams : [String: String] = [
            SocialMediaEmailDataApi.email              :       email
        ]
        
        let headers : [String: String] = [
            "Authorization" : LocalStore.shared.authorization
        ]
        
        baseRequestApi(url, .post, socialMediaEmailDataParams, headers) { (result: SocialMediaEmailDataModel?) in
            print(result!)
            completion(result!)
        }
    }

    // SEON IP address API
}
