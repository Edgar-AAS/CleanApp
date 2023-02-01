import XCTest
import UIKit
@testable import UI

class WelcomeViewControllerTests: XCTestCase {
    func test_loginButton_calls_login_on_tap() {
        let (sut, buttonSpy) = makeSut()
        sut.loginButton.simulateTap()
        XCTAssertEqual(buttonSpy.clicks, 1)
    }
}

extension WelcomeViewControllerTests {
    func makeSut() -> (sut: WelcomeViewController, buttonSpy: ButtonSpy) {
        let buttonSpy = ButtonSpy()
        let sut = WelcomeViewController.instantiate()
        sut.login = buttonSpy.onClick //ponteiro
        sut.loadViewIfNeeded()
        return (sut, buttonSpy)
    }
    
    //criando um ButtonSpy com a mesma assinatura do login
    class ButtonSpy {
        var clicks = 0
        
        func onClick() {
            clicks += 1
        }
    }
}
