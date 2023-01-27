//  ApiConstants.swift
//  Created by CS on 24/01/23.

import Foundation

// MARK: - Token
struct Token {
    static let basetoken = "eyJhbGciOiJIUzI1NiJ9.bXJ2ZXJtYTkxMzc4QGdtYWlsLmNvbUFqYXkga3VtYXI.I4BDxb2XxU1L5whIV0t6M_Qet5SeZeW51TmTV1wwXCw"
    static let token = "token"
}

// MARK: - BASE URL
struct Apis {
    static let baseUrl = "https://api.ipass-mena.com/"
}

// MARK: - Authentication and Authorization
// -- Login and Registration APIs

// Token API
struct TokenApi {
    static let baseApi = (Apis.baseUrl) + "api/v1/ipass/" + "jwttoken"
    static let first_name = "first_name"
    static let last_name = "last_name"
    static let email = "email"
    static let password = "password"
}

// Initiate Account API
struct InitiateAccountApi {
    static let baseApi = (Apis.baseUrl) + "api/v1/ipass/" + "account/token"
    static let customerInternalReference = "customerInternalReference"
    static let workflowDefinition = "workflowDefinition"
    static let callbackUrl = "callbackUrl"
    static let userReference = "userReference"
    static let tokenLifetime = "tokenLifetime"
    static let web = "web"
}

// MARK: - Workflow APIs
// Workflow Status API
struct WorkflowStatusApi {
    static let baseApi = (Apis.baseUrl) + "api/v1/ipass/" + "workflow/status"
    static let accountId = "accountId"
    static let workflowExecutionId = "workflowExecutionId"
}

// Workflow Details API
struct WorkflowDetailsApi {
    static let baseApi = (Apis.baseUrl) + "api/v1/ipass/" + "detail/user"
    static let accountId = "accountId"
    static let workflowExecutionId = "workflowExecutionId"
    static let sessid = "sessid"
    static let email = "email"
}

// MARK: - Document Verification APIs
// Front Image API
struct FrontImageApi {
    static let baseApi = (Apis.baseUrl) + "get/front/image"
    static let accountId = "accountId"
    static let credentialId = "credentialId"
}

// Back Image API
struct BackImageApi {
    static let baseApi = (Apis.baseUrl) + "get/back/image"
    static let accountId = "accountId"
    static let credentialId = "credentialId"
}

// Face Image API
struct FaceImageApi {
    static let baseApi = (Apis.baseUrl) + "get/face/image"
    static let accountId = "accountId"
    static let credentialId = "credentialId"
}

// Liveness Image API
struct LivenessImageApi {
    static let baseApi = (Apis.baseUrl) + "get/liveness/image"
    static let accountId = "accountId"
    static let credentialId = "credentialId"
}

// MARK: - Clean Data APIs
// Wipeout Data of Workflow Execution API
struct WipeoutDataApi {
    static let baseApi = (Apis.baseUrl) + "api/v1/" + "delete/alldata"
    static let accountId = "accountId"
}

// Wipeout Whole Account Data API
struct WipeoutWholeAccountApi {
    static let baseApi = (Apis.baseUrl) + "api/v1/" + "delete/account/data"
    static let accountId = "accountId"
}

// MARK: - KYC APIs
// KYC Initiate Account API
struct KYCInitiateAccountApi {
    static let baseApi = (Apis.baseUrl) + "api/v1/" + "kyc/initate/account"
    static let accountId = "accountId"
    static let customerInternalReference = "customerInternalReference"
    static let workflowDefinition = "workflowDefinition"
}

// KYC Prepare Data API
struct KYCPrepareDataApi {
    static let baseApi = (Apis.baseUrl) + "api/v1/" + "kyc/prepare_data"
    static let accountId = "accountId"
    static let workflowExecutionId = "workflowExecutionId"
    static let credentialId = "credentialId"
    static let firstName = "firstName"
    static let lastName = "lastName"
    static let dateOfBirth = "dateOfBirth"
}

// KYC Put Prepare Data API
struct KYCPutPrepareDataApi {
    static let baseApi = (Apis.baseUrl) + "api/v1/" + "kyc/putprepare/data"
    static let accountId = "accountId"
    static let workflowExecutionId = "workflowExecutionId"
}

// KYC Workflow Status API
struct KYCWorkflowStatusApi {
    static let baseApi = (Apis.baseUrl) + "api/v1/" + "ipass/kyc/workflow/status"
    static let accountId = "accountId"
    static let workflowExecutionId = "workflowExecutionId"
}

// KYC Get Detail API
struct KYCGetDetailApi {
    static let baseApi = (Apis.baseUrl) + "api/v1/" + "ipass/kyc/user/detail"
    static let accountId = "accountId"
    static let workflowExecutionId = "workflowExecutionId"
}

// MARK: - Social Media Data APIs
// Social Media Phone Data API
struct SocialMediaPhoneDataApi {
    static let baseApi = (Apis.baseUrl) + "api/v1/" + "ipass/social/media/phone"
    static let phone_number = "phone_number"
}

// Social Media Email Data API
struct SocialMediaEmailDataApi {
    static let baseApi = (Apis.baseUrl) + "api/v1/" + "ipass/social/media/email"
    static let email = "email"
}

// SEON IP address API
