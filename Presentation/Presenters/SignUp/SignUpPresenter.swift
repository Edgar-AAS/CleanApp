import Foundation
import Domain

public final class SignUpPresenter {
    private let alertView: AlertView
    private let emailValidator: EmailValidator
    private let addAccount: AddAccount
    private let loadingView: LoadingView
    
    public init(alertView: AlertView, emailValidator: EmailValidator, addAccount: AddAccount, loadingView: LoadingView) {
        self.alertView = alertView
        self.emailValidator = emailValidator
        self.addAccount = addAccount
        self.loadingView = loadingView
    }
    
    public func signUp(viewModel: SignUpViewModel) {
        if let message = validate(viewModel: viewModel) {
            alertView.showMessage(viewModel: AlertViewModel(title: "Erro de validação", message: message))
        } else {
            loadingView.display(viewModel: LoadingViewModel(isLoading: true))
            addAccount.add(addAccountModel: SignUpMapper.toAddAccountModel(viewModel: viewModel)) { [weak self] (result) in
                guard let self = self else { return }
                switch result {
                    case .failure:
                        self.alertView.showMessage(viewModel: AlertViewModel(title: "Erro", message: "Algo inesperado aconteceu tente novamente em alguns instantes"))
                    case .success:
                        self.alertView.showMessage(viewModel: AlertViewModel(title: "Sucesso", message: "Conta criada com sucesso."))
                }
                self.loadingView.display(viewModel: LoadingViewModel(isLoading: false))
            }
        }
    }
   
    private func validate(viewModel: SignUpViewModel) -> String? {
        if viewModel.name == nil || viewModel.name!.isEmpty {
            return "O campo Nome é obrigatório"
        } else if viewModel.email == nil || viewModel.name!.isEmpty {
            return "O campo Email é obrigatório"
        } else if viewModel.password == nil || viewModel.password!.isEmpty {
            return "O campo Senha é obrigatório"
        } else if viewModel.passwordConfirmation == nil || viewModel.passwordConfirmation!.isEmpty {
            return "O campo Confirmar senha é obrigatório"
        }  else if viewModel.password != viewModel.passwordConfirmation {
            return "O campo Confirmar Senha é inválido"
        } else if !emailValidator.isValid(email: viewModel.email!) { //so cai aqui se for true
            return "O campo Email é inválido"
        }
        return nil
    }
}
