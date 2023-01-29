import Foundation

//add account USE CASE 
//o padrao do swift é internal que só é acessivel dentro do mesmo target
//setando protocol e models para public
//por padrao o construtor de uma struct é internal
//para acessa-lo em outro target e preciso criar um novo construtor publico
//retorno assincrono


public protocol Authentication {
    typealias Result = Swift.Result<AccountModel, DomainError>
    func add(addAccountModel: AuthenticationModel, completion: @escaping (Result) -> Void)
}

//oque a API espera receber1
public struct AuthenticationModel: Model {
    public var email: String
    public var password: String
    
    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
