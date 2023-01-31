protocol iPassEndpoint {
        var httpMethod: iPassHTTPMethod { get }
        var baseURL: String { get }
        var path: String { get }
        var headers: [String: String] { get }
        var body: [String: Any]? { get }
}

extension iPassEndpoint {
    // a default extension that creates the full URL
    var url: String {
        return baseURL + path
    }
}
