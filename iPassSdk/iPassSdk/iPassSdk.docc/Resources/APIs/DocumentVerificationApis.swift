//  DocumentVerificationApis.swift
//  Created by CS on 25/01/23.

import UIKit
import Alamofire
import PKHUD

class DocumentVerificationApis : NSObject {
    
    // MARK: - Shared Instance
    static let shared = DocumentVerificationApis()
    
    // MARK: - Document Verification APIs
    
    // Front Image API
    func frontImageApi(_ view: UIView, _ accountId: String, _ credentialId: String, completion: @escaping(_ : FrontImageModel) -> Void) {
        HUD.show(.progress, onView: view)
        
        var url = URLComponents(string: FrontImageApi.baseApi)!
        url.queryItems = [
            URLQueryItem(name: Token.token, value: Token.basetoken),
            URLQueryItem(name: FrontImageApi.accountId, value: accountId),
            URLQueryItem(name: FrontImageApi.credentialId, value: credentialId)
        ]
        
        let headers : [String: String] = [
            "Authorization" : LocalStore.shared.authorization
        ]
        
        baseRequestApi(url, .get, nil, headers) { (result: FrontImageModel?) in
            print(result!)
            completion(result!)
        }
    }
    
    // Back Image API
    func backImageApi(_ view: UIView, _ accountId: String, _ credentialId: String, completion: @escaping(_ : BackImageModel) -> Void) {
        HUD.show(.progress, onView: view)
        
        var url = URLComponents(string: BackImageApi.baseApi)!
        url.queryItems = [
            URLQueryItem(name: Token.token, value: Token.basetoken),
            URLQueryItem(name: BackImageApi.accountId, value: accountId),
            URLQueryItem(name: BackImageApi.credentialId, value: credentialId)
        ]
        
        let headers : [String: String] = [
            "Authorization" : LocalStore.shared.authorization
        ]
        
        baseRequestApi(url, .get, nil, headers) { (result: BackImageModel?) in
            print(result!)
            completion(result!)
        }
    }
    
    // Face Image API
    func faceImageApi(_ view: UIView, _ accountId: String, _ credentialId: String, completion: @escaping(_ : FaceImageModel) -> Void) {
        HUD.show(.progress, onView: view)
        
        var url = URLComponents(string: FaceImageApi.baseApi)!
        url.queryItems = [
            URLQueryItem(name: Token.token, value: Token.basetoken),
            URLQueryItem(name: FaceImageApi.accountId, value: accountId),
            URLQueryItem(name: FaceImageApi.credentialId, value: credentialId)
        ]
        
        let headers : [String: String] = [
            "Authorization" : LocalStore.shared.authorization
        ]
        
        baseRequestApi(url, .get, nil, headers) { (result: FaceImageModel?) in
            print(result!)
            completion(result!)
        }
    }
    
    // Liveness Image API
    func livenessImageApi(_ view: UIView, _ accountId: String, _ credentialId: String, completion: @escaping(_ : LivenessImageModel) -> Void) {
        HUD.show(.progress, onView: view)
        
        var url = URLComponents(string: LivenessImageApi.baseApi)!
        url.queryItems = [
            URLQueryItem(name: Token.token, value: Token.basetoken),
            URLQueryItem(name: LivenessImageApi.accountId, value: accountId),
            URLQueryItem(name: LivenessImageApi.credentialId, value: credentialId)
        ]
        
        let headers : [String: String] = [
            "Authorization" : LocalStore.shared.authorization
        ]
        
        baseRequestApi(url, .get, nil, headers) { (result: LivenessImageModel?) in
            print(result!)
            completion(result!)
        }
    }
}
