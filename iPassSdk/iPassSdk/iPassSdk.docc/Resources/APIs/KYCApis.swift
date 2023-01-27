//  KYCApis.swift
//  Created by CS on 25/01/23.

import UIKit
import Alamofire
import PKHUD

class KYCApis : NSObject {
    
    // MARK: - Shared Instance
    static let shared = KYCApis()
    
    // MARK: - KYC APIs
    
    // KYC Initiate Account API
    func kYCInitiateAccountApi(_ view: UIView, _ accountId: String, _ customerInternalReference: String, _ workflowDefinition: String, completion: @escaping(_ : KYCInitiateAccountModel) -> Void) {
        HUD.show(.progress, onView: view)
        
        var url = URLComponents(string: KYCInitiateAccountApi.baseApi)!
        url.queryItems = [
            URLQueryItem(name: Token.token, value: Token.basetoken),
            URLQueryItem(name: KYCInitiateAccountApi.accountId, value: accountId)
        ]
        
        let kYCInitiateAccountParams : [String: String] = [
            KYCInitiateAccountApi.customerInternalReference        :       customerInternalReference,
            KYCInitiateAccountApi.workflowDefinition               :       workflowDefinition
        ]
        
        let headers : [String: String] = [
            "Authorization" : LocalStore.shared.authorization
        ]
        
        baseRequestApi(url, .put, kYCInitiateAccountParams, headers) { (result: KYCInitiateAccountModel?) in
            print(result!)
            completion(result!)
        }
    }
    
    // KYC Prepare Data API
    func kYCPrepareDataApi(_ view: UIView, _ accountId: String, _ workflowExecutionId: String, _ credentialId: String, _ firstName: String, _ lastName: String, _ dateOfBirth: String, completion: @escaping(_ : KYCPrepareDataModel) -> Void) {
        HUD.show(.progress, onView: view)
        
        var url = URLComponents(string: KYCPrepareDataApi.baseApi)!
        url.queryItems = [
            URLQueryItem(name: Token.token, value: Token.basetoken),
            URLQueryItem(name: KYCPrepareDataApi.accountId, value: accountId),
            URLQueryItem(name: KYCPrepareDataApi.workflowExecutionId, value: workflowExecutionId),
            URLQueryItem(name: KYCPrepareDataApi.credentialId, value: credentialId)
        ]
        
        let kYCPrepareDataParams : [String: String] = [
            KYCPrepareDataApi.firstName        :       firstName,
            KYCPrepareDataApi.lastName         :       lastName,
            KYCPrepareDataApi.dateOfBirth      :       dateOfBirth
        ]
        
        let headers : [String: String] = [
            "Authorization" : LocalStore.shared.authorization
        ]
        
        baseRequestApi(url, .post, kYCPrepareDataParams, headers) { (result: KYCPrepareDataModel?) in
            print(result!)
            completion(result!)
        }
    }

    // KYC Put Prepare Data API
    func kYCPutPrepareDataApi(_ view: UIView, _ accountId: String, _ workflowExecutionId: String, completion: @escaping(_ : KYCPutPrepareDataModel) -> Void) {
        HUD.show(.progress, onView: view)
        
        var url = URLComponents(string: KYCPutPrepareDataApi.baseApi)!
        url.queryItems = [
            URLQueryItem(name: Token.token, value: Token.basetoken),
            URLQueryItem(name: KYCPutPrepareDataApi.accountId, value: accountId),
            URLQueryItem(name: KYCPutPrepareDataApi.workflowExecutionId, value: workflowExecutionId)
        ]
        
        let headers : [String: String] = [
            "Authorization" : LocalStore.shared.authorization
        ]
        
        baseRequestApi(url, .put, nil, headers) { (result: KYCPutPrepareDataModel?) in
            print(result!)
            completion(result!)
        }
    }
    
    // KYC Workflow Status API
    func kYCWorkflowStatusApi(_ view: UIView, _ accountId: String, _ workflowExecutionId: String, completion: @escaping(_ : KYCWorkflowStatusModel) -> Void) {
        HUD.show(.progress, onView: view)
        
        var url = URLComponents(string: KYCWorkflowStatusApi.baseApi)!
        url.queryItems = [
            URLQueryItem(name: KYCWorkflowStatusApi.accountId, value: accountId),
            URLQueryItem(name: KYCWorkflowStatusApi.workflowExecutionId, value: workflowExecutionId)
        ]
        
        let headers : [String: String] = [
            "Authorization" : LocalStore.shared.authorization
        ]
        
        baseRequestApi(url, .get, nil, headers) { (result: KYCWorkflowStatusModel?) in
            print(result!)
            completion(result!)
        }
    }

    // KYC Get Detail API
    func kYCGetDetailApi(_ view: UIView, _ accountId: String, _ workflowExecutionId: String, completion: @escaping(_ : KYCGetDetailModel) -> Void) {
        HUD.show(.progress, onView: view)
        
        var url = URLComponents(string: KYCGetDetailApi.baseApi)!
        url.queryItems = [
            URLQueryItem(name: Token.token, value: Token.basetoken),
            URLQueryItem(name: KYCGetDetailApi.accountId, value: accountId),
            URLQueryItem(name: KYCGetDetailApi.workflowExecutionId, value: workflowExecutionId)
        ]
        
        let headers : [String: String] = [
            "Authorization" : LocalStore.shared.authorization
        ]
        
        baseRequestApi(url, .get, nil, headers) { (result: KYCGetDetailModel?) in
            print(result!)
            completion(result!)
        }
    }
}
