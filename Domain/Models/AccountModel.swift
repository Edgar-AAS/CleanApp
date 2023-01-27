import Foundation

//Oque a API devolve
public struct AccountModel: Model  {
    public var accessToken: String
    
    public init(accessToken: String) {
        self.accessToken = accessToken
    }
}
