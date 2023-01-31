protocol iPassNetworkRequest: AnyObject {
    func request<T: Codable>(_ url: String, httpMethod: iPassHTTPMethod, params: Codable?, headers: [String: String], completion: @escaping (ApiResult<T, K>) -> Void)
}

