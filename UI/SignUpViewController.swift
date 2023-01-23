import Foundation
import UIKit
import Presentation

final class SignUpViewController: UIViewController {
    @IBOutlet var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet var saveButton: UIButton!
    var signUp: ((SignUpViewModel) -> Void)? //dependencia
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    @objc private func saveButtonTapped() {
        signUp?(SignUpViewModel(name: nil, email: nil, password: nil, passwordConfirmation: nil))
    }
}

extension SignUpViewController: LoadingView {
    func display(viewModel: LoadingViewModel) {
        if viewModel.isLoading {
            loadingIndicator.startAnimating()
        } else {
            loadingIndicator.stopAnimating()
        }
    }
}

extension SignUpViewController: AlertView {
    func showMessage(viewModel: AlertViewModel) {
        
    }
}
