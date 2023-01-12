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
