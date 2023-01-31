//  LoginApis.swift
//  Created by CS on 24/01/23.

import UIKit
import Alamofire
import PKHUD 

class LoginApis : NSObject {
    
    // MARK: - Shared Instance
    static let shared = LoginApis()
    
    // MARK: - Authentication and Authorization
    // -- Login and Registration APIs
    
    // Token API
    func tokenApi(_ view: UIView, _ first_name: String, _ last_name: String, _ email: String, _ password: String, completion: @escaping(Result<TokenModel, TokenModel>) -> Void) {
        HUD.show(.progress, onView: view)
        
        var url = URLComponents(string: TokenApi.baseApi)!
        url.queryItems = [
            URLQueryItem(name: Token.token, value: Token.basetoken)
        ]
        
        let tokenParams : [String: String] = [
            TokenApi.first_name              :       first_name,
            TokenApi.last_name               :       last_name,
            TokenApi.email                   :       email,
            TokenApi.password                :       password
        ]
        
        baseRequestApi(url, .post, tokenParams, nil) { (result: TokenModel?) in
            print(result!)
            completion(result!)
        }
    }
    
    // Initiate Account API
    func initiateAccountApi(_ view: UIView, _ customerInternalReference: String, _ workflowDefinition: String, _ callbackUrl: String, _ userReference: String, _ tokenLifetime: String, _ web: String, completion: @escaping(_ : InitiateAccountModel) -> Void) {
        HUD.show(.progress, onView: view)
        
        var url = URLComponents(string: InitiateAccountApi.baseApi)!
        url.queryItems = [
            URLQueryItem(name: Token.token, value: Token.basetoken)
        ]
        
        let initiateAccountParams : [String: String] = [
            InitiateAccountApi.customerInternalReference        :       customerInternalReference,
            InitiateAccountApi.workflowDefinition               :       workflowDefinition,
            InitiateAccountApi.callbackUrl                      :       callbackUrl,
            InitiateAccountApi.userReference                    :       userReference,
            InitiateAccountApi.tokenLifetime                    :       tokenLifetime,
            InitiateAccountApi.web                              :       web
        ]
        
        let headers : [String: String] = [
            "Authorization" : LocalStore.shared.authorization
        ]
        
        baseRequestApi(url, .post, initiateAccountParams, headers) { (result: InitiateAccountModel?) in
            print(result!)
            completion(result!)
        }
    }
}
