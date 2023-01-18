import Foundation
import Domain

func makeAccountModel() -> AccountModel {
    return AccountModel(
        id: "any_id",
        name: "paulo",
        email: "paulo@outlook.com",
        password: "password123"
    )
}

func makeAddAccountModel() -> AddAccountModel {
    return AddAccountModel(
        name: "any_name",
        email: "any_email@mail.com",
        password: "any_password",
        passwordConfirmation: "any_password"
    )
}
