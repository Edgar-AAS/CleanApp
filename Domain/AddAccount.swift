import Foundation

//add account use case
//o padrao do swift é internal que só é acessivel dentro do mesmo target
//setando protocol e models para public
//por padrao o construtor de uma struct é internal
//para acessa-lo em outro target e preciso criar um novo construtor como public

public protocol AddAccount {
    func add(addAccountModel: AddAccountModel, completion: @escaping (Result<AccountModel, Error>) -> Void) //assincrono
}

//oque a API espera receber
public struct AddAccountModel: Encodable {
    public var name: String
    public var email: String
    public var password: String
    public var passwordConfirmation: String
    
    public init(name: String, email: String, password: String, passwordConfirmation: String) {
        self.name = name
        self.email = email
        self.password = password
        self.passwordConfirmation = passwordConfirmation
    }
}
