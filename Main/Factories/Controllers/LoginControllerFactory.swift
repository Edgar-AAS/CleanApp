import Foundation
import Domain
import UI
import Presentation
import Validation
import Domain
import Infra

public func makeLoginController(authentication: Authentication) -> LoginViewController {
    let controller = LoginViewController.instantiate()
    let validationComposite = ValidationComposite(validations: makeLoginValidations())
    let presenter = LoginPresenter(alertView: WeakVarProxy(controller), authentication: authentication , loadingView: WeakVarProxy(controller), validation: validationComposite)
    controller.login = presenter.login
    return controller
}

public func makeLoginValidations() -> [Validation] {
    return [
        RequiredFieldValidation(fieldName: "email", fieldLabel: "Email"),
        EmailValidation(fieldName: "email", fieldLabel: "Email", emailValidator: makeEmailValidatorAdapter()),
        RequiredFieldValidation(fieldName: "password", fieldLabel: "Senha")
    ]
}
