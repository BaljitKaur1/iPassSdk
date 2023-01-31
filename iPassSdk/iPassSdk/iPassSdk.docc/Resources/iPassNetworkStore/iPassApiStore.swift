// MARK: Generic api results
enum ApiResult<T, K> where K: Codable, T: Codable {
    case success(T?)
    case failure(K)
}

public class iPassApiStore: iPassApiCollection {
    
    var networkRequest: iPassNetworkRequest
    
    required init(networkRequest: iPassNetworkRequest) {
        self.networkRequest = networkRequest
    }
    
    func request<T: Codable>(endpoint: iPassEndpointCases, params: Codable? = nil, completion: @escaping (ApiResult<T, K>) -> Void) {
        networkRequest.request(endpoint.url, httpMethod: endpoint.httpMethod, params: params, headers: endpoint.headers) {(result: ApiResult<T, T>) in
            switch result {
            case .success(let value):
                if let baseResponse = value {
                    if baseResponse.statusCode == 200 {
                        completion(.success(value?.data))
                    } else {
                        completion(.failure(K))
                    }
                }
                else {
                    completion(.failure(K))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
        
    func generateTokenApi(completion: @escaping (Result<TokenModel?, TokenErrorModel>) -> Void) {
                        request(endpoint: iPassEndpointCases.generateToken) {(result: ApiResult<TokenModel?, TokenErrorModel>) in
            switch result {
            case .success(let value):
                if let value = value {
                    completion(.success(value))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}

