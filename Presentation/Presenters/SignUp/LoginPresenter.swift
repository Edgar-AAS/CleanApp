import Foundation
import Domain

public final class LoginPresenter {
    private let validation: Validation
    private let alertView: AlertView
    private let authentication: Authentication
    
    public init(authentication: Authentication, alertView: AlertView, validation: Validation) {
        self.validation = validation
        self.alertView = alertView
        self.authentication = authentication
    }
    
    public func login(viewModel: LoginViewModel) {
        if let message = validation.validate(data: viewModel.toJson()) {
            alertView.showMessage(viewModel: AlertViewModel(title: "Erro de validação", message: message))
        } else {
            authentication.auth(authenticationModel: viewModel.toAuthenticationModel()) { _ in }
        }
    }
}
