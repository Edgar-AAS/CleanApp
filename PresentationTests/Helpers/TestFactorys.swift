import Foundation
import Presentation

func makeSignUpViewModel(
    name: String? = "any_name",
    email: String? = "any_email@mail.com",
    password: String? = "any_password",
    passwordConfirmation: String? = "any_password") -> SignUpRequest
{
    return SignUpRequest(name: name, email: email, password: password, passwordConfirmation: passwordConfirmation)
}

func makeLoginViewModel() -> LoginRequest {
    return LoginRequest(email: "any_email@mail.com", password: "any_password")
}
