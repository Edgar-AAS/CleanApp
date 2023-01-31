import Foundation
import Domain

//Decorator: Adicionar funcionalidade a uma classe(a instância dela) sem precisar muda-la
//tratamento de threading (dentro da main layer (composição dos objetos)
public final class MainQueueDispatchDecorator<T> {
    private let instance: T
    
    public init(_ instance: T) {
        self.instance = instance
    }
    
    //Validando se esta ou nao na main thread
    func dispatch(completion: @escaping () -> Void) {
        guard Thread.isMainThread else { return DispatchQueue.main.async(execute: completion) }
        completion()
    }
}

//Qualquer classe que tiver em conformidade com o addAccount, e estiver usando esse decorator, vai ter acesso a esse comportamento
extension MainQueueDispatchDecorator: AddAccount where T: AddAccount {
    public func add(addAccountModel: AddAccountModel, completion: @escaping (AddAccount.Result) -> Void) {
        instance.add(addAccountModel: addAccountModel) { [weak self] result  in
            self?.dispatch { completion(result) }
        }
    }
}

extension MainQueueDispatchDecorator: Authentication where T: Authentication {
    public func auth(authenticationModel: AuthenticationModel, completion: @escaping (Authentication.Result) -> Void) {
        instance.auth(authenticationModel: authenticationModel) { [weak self] result  in
            self?.dispatch { completion(result) }
        }
    }
}
