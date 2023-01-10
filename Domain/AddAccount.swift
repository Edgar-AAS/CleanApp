import Foundation

//add account use case
//o padrao do swift é internal que só é acessivel dentro do mesmo target
//

public protocol AddAccount {
    func add(addAccountModel: AddAccountModel, completion: @escaping (Result<AccountModel, Error>) -> Void) //assincrono
}

//oque a API espera receber
public struct AddAccountModel {
    public var name: String
    public var email: String
    public var password: String
    public var passwordConfirmation: String
}
