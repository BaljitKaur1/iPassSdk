//  WorkflowApis.swift
//  Created by CS on 25/01/23.

import UIKit
import Alamofire
import PKHUD

class WorkflowApis : NSObject {
    
    // MARK: - Shared Instance
    static let shared = WorkflowApis()
    
    // MARK: - Workflow APIs
    
    // Workflow Status API
    func workflowStatusApi(_ view: UIView, _ accountId: String, _ workflowExecutionId: String, completion: @escaping(_ : WorkFlowStatusModel) -> Void) {
        HUD.show(.progress, onView: view)
        
        var url = URLComponents(string: WorkflowStatusApi.baseApi)!
        url.queryItems = [
            URLQueryItem(name: Token.token, value: Token.basetoken),
            URLQueryItem(name: WorkflowStatusApi.accountId, value: accountId),
            URLQueryItem(name: WorkflowStatusApi.workflowExecutionId, value: workflowExecutionId)
        ]
        
        let headers : [String: String] = [
            "Authorization" : LocalStore.shared.authorization
        ]
        
        baseRequestApi(url, .get, nil, headers) { (result: WorkFlowStatusModel?) in
            print(result!)
            completion(result!)
        }
    }
    
    // Workflow Details API
    func workflowDetailsApi(_ view: UIView, _ accountId: String, _ workflowExecutionId: String, _ sessid: String, _ email: String, completion: @escaping(_ : WorkflowDetailsModel) -> Void) {
        HUD.show(.progress, onView: view)
        
        var url = URLComponents(string: WorkflowDetailsApi.baseApi)!
        url.queryItems = [
            URLQueryItem(name: Token.token, value: Token.basetoken),
            URLQueryItem(name: WorkflowDetailsApi.accountId, value: accountId),
            URLQueryItem(name: WorkflowDetailsApi.workflowExecutionId, value: workflowExecutionId),
            URLQueryItem(name: WorkflowDetailsApi.sessid, value: sessid),
            URLQueryItem(name: WorkflowDetailsApi.email, value: email)
        ]
        
        let headers : [String: String] = [
            "Authorization" : LocalStore.shared.authorization
        ]
        
        baseRequestApi(url, .get, nil, headers) { (result: WorkflowDetailsModel?) in
            print(result!)
            completion(result!)
        }
    }
}
