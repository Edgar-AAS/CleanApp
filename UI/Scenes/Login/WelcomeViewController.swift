import Foundation
import UIKit

public final class WelcomeViewController: UIViewController, Storyboarded {
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    
    //click no botao, essa função deve chamada e o comportamento nao depende desse controller, motivo: Nao acoplagem de componentes dentro da controller, a viewController deve ser burra em relação a qual tela chamar e a quais dependencias devem ser injetadas para o roteamento.
    //existe a opcao de injetar a logica de navegacao atraves do presenter
    
    public var login: (() -> Void)?
    public var signUp: (() -> Void)?

    public override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        title = "4Devs"
        loginButton.layer.cornerRadius = 5
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        signUpButton.layer.cornerRadius = 5
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    @objc private func loginButtonTapped() {
        login?()
    }
    
    @objc private func signUpButtonTapped() {
        signUp?()
    }
}
