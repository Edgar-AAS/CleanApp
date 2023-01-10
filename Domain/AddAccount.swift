import Foundation

//add account use case

protocol AddAccount {
    func add(addAccountModel: AddAccountModel, completion: @escaping (Result<AccountModel, Error>) -> Void) //assincrono
}

//oque a API espera receber
struct AddAccountModel {
    var name: String
    var email: String
    var password: String
    var passwordConfirmation: String
}
