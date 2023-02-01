enum iPassEndpointCases: iPassEndpoint {
    case generateToken
    
    var httpMethod: iPassHTTPMethod {
        switch self {
        case .generateToken:
            return .get
        default
            return .post
        }
    }
    
    var baseURL: String {
        return "https://api.ipass-mena.com/"
    }
    
    var path: String {
        switch self {
        case .generateToken:
            return baseURL + "api/v1/ipass/" + "jwttoken"
        }
    }
    
    var headers: [String: String] {
        var httpHeaders = ["Authorization" : LocalStore.shared.authorization]
        return httpHeaders
    }
    
    var body: [String: Any]? {
        return [:]
    }
}
