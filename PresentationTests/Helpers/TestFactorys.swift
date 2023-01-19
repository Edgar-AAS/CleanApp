import Foundation
import Presentation

func makeRequiredAlertViewModel(fieldName: String) -> AlertViewModel {
    return AlertViewModel(title: "Erro de validação", message: "O campo \(fieldName) é obrigatório")
}

func makeInvalidAlertViewModel(fieldName: String) -> AlertViewModel {
    return AlertViewModel(title: "Erro de validação", message: "O campo \(fieldName) é inválido")
}

func makeErrorAlertViewModel(message: String) -> AlertViewModel {
    return AlertViewModel(title: "Erro", message: message)
}

func makeSuccessAlertViewModel(message: String) -> AlertViewModel {
    return AlertViewModel(title: "Sucesso", message: message)
}

func makeSignUpViewModel(
    name: String? = "any_name",
    email: String? = "any_email@mail.com",
    password: String? = "any_password",
    passwordConfirmation: String? = "any_password") -> SignUpViewModel
{
    return SignUpViewModel(name: name, email: email, password: password, passwordConfirmation: passwordConfirmation)
}

