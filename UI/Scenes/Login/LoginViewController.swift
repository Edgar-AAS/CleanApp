import Foundation
import UIKit
import Presentation

public final class LoginViewController: UIViewController, Storyboarded {
    @IBOutlet var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet var loginButton: UIButton!
    
    public var signUp: ((SignUpViewModel) -> Void)? //dependencia
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        title = "4Devs"
        loginButton.layer.cornerRadius = 5
        hideKeyboardTap()
    }
}

extension LoginViewController: LoadingView {
    public func display(viewModel: LoadingViewModel) {
        if viewModel.isLoading {
            view.isUserInteractionEnabled = false
            loadingIndicator.startAnimating()
        } else {
            view.isUserInteractionEnabled = true
            loadingIndicator.stopAnimating()
        }
    }
}

extension LoginViewController: AlertView {
    public func showMessage(viewModel: AlertViewModel) {
        let alert = UIAlertController(title: viewModel.title, message: viewModel.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
}
