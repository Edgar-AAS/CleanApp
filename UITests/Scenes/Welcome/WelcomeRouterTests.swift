import XCTest
import UIKit
@testable import UI

class WelcomeRouterTests: XCTestCase {
    func test_goToLogin_calls_nav_with_correct_vc() {
        let (sut, nav)  = makeSut()
        sut.goToLogin()
        XCTAssertTrue(nav.viewControllers[0] is LoginViewController)
        XCTAssertEqual(nav.viewControllers.count, 1)
    }
    
    func test_goSignUp_calls_nav_with_correct_vc() {
        let (sut, nav)  = makeSut()
        sut.goToSignUp()
        XCTAssertTrue(nav.viewControllers[0] is SignUpViewController)
        XCTAssertEqual(nav.viewControllers.count, 1)
    }
}

extension WelcomeRouterTests {
    func makeSut() -> (sut: WelcomeRouter, nav: NavigationController) {
        let loginFactorySpy = LoginFactorySpy()
        let signUpFactorySpy = SignUpFactorySpy()
        let nav = NavigationController()
        let sut = WelcomeRouter(nav: nav, loginFactory: loginFactorySpy.makeLogin, signUpFactory: signUpFactorySpy.makeSignUp)
        return (sut, nav)
    }
}

extension WelcomeRouterTests {
    class LoginFactorySpy {
        func makeLogin() -> LoginViewController {
            return LoginViewController.instantiate()
        }
    }
    
    class SignUpFactorySpy {
        func makeSignUp() -> SignUpViewController {
            return SignUpViewController.instantiate()
        }
    }
}
