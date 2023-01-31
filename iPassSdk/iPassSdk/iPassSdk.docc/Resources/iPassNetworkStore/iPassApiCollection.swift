protocol iPassApiCollection {
    init(networkRequest: iPassNetworkRequest)
    // Authentication
    func generateToken(subAccountToken: String?, completion:@escaping (Result<TokenModel, TokenErrorModel>) -> Void)
    
}
