import Foundation
import Data
import Infra
import Domain

final class UseCaseFactory {
    private static let httpClient = AlamofireAdapter()
    private static let apiBaseUrl = "https://clean-node-api.herokuapp.com/api"
    
    private static func makeurl(path: String) -> URL {
        return URL(string: "\(apiBaseUrl)/\(path)")!
    }
    
    static func makeRemoteAddAccount() -> AddAccount {
        return RemoteAddAccount(url: makeurl(path: "signup"), httpClient: httpClient)
    }
}
