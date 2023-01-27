//  CleanDataApis.swift
//  Created by CS on 25/01/23.

import UIKit
import Alamofire
import PKHUD

class CleanDataApis : NSObject {
    
    // MARK: - Shared Instance
    static let shared = CleanDataApis()
    
    // MARK: - Clean Data APIs
    
    // Wipeout Data of Workflow Execution API
    func wipeoutDataApi(_ view: UIView, _ accountId: String, completion: @escaping(_ : WipeoutDataModel) -> Void) {
        HUD.show(.progress, onView: view)
        
        var url = URLComponents(string: WipeoutDataApi.baseApi)!
        url.queryItems = [
            URLQueryItem(name: WipeoutDataApi.accountId, value: accountId)
        ]
        
        let headers : [String: String] = [
            "Authorization" : LocalStore.shared.authorization
        ]
        
        baseRequestApi(url, .delete, nil, headers) { (result: WipeoutDataModel?) in
            print(result!)
            completion(result!)
        }
    }
    
    // Wipeout Whole Account Data API
    func wipeoutWholeAccountApi(_ view: UIView, _ accountId: String, completion: @escaping(_ : WipeoutWholeAccountModel) -> Void) {
        HUD.show(.progress, onView: view)
        
        var url = URLComponents(string: WipeoutWholeAccountApi.baseApi)!
        url.queryItems = [
            URLQueryItem(name: WipeoutWholeAccountApi.accountId, value: accountId)
        ]
        
        let headers : [String: String] = [
            "Authorization" : LocalStore.shared.authorization
        ]
        
        baseRequestApi(url, .delete, nil, headers) { (result: WipeoutWholeAccountModel?) in
            print(result!)
            completion(result!)
        }
    }
}
