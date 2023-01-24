import Foundation
import Domain

//tratamento de threading
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
    public func add(addAccountModel: AddAccountModel, completion: @escaping (Result<AccountModel, DomainError>) -> Void) {
        instance.add(addAccountModel: addAccountModel) { [weak self] result  in
            self?.dispatch { completion(result) }
        }
    }
}
