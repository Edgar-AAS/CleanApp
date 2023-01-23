import XCTest
import UIKit
import Presentation
@testable import UI

class SignUpViewControllerTests: XCTestCase {
    func test_loading_is_hidden_on_start() {
        XCTAssertEqual(makeSut().loadingIndicator.isAnimating, false)
    }
    
    func test_sut_implements_loadView() {
        XCTAssertNotNil(makeSut() as LoadingView)
    }
    
    func test_sut_implements_alertView() {
        XCTAssertNotNil(makeSut() as AlertView)
    }
    
    func test_saveButton_calls_signUp_on_tap() {
        var callsCount = 0
        
        let signSpy: (SignUpViewModel) -> Void = { _ in
            callsCount += 1
        }
        
        let sut = makeSut(signUpSpy: signSpy)
        
        sut.saveButton.simulateTap()
        XCTAssertEqual(callsCount, 1)
        XCTAssertNotNil(makeSut() as AlertView)
    }
}

extension SignUpViewControllerTests {
    func makeSut(signUpSpy: ((SignUpViewModel) -> Void)? = nil) -> SignUpViewController {
        let storyboard = UIStoryboard(name: "SignUp", bundle: Bundle(for: SignUpViewController.self))
        let sut = storyboard.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
        sut.signUp = signUpSpy
        sut.loadViewIfNeeded()
        return sut
    }
}

//simulando eventos
extension UIControl {
    func simulate(event: UIControl.Event) {
        allTargets.forEach { (target) in
            actions(forTarget: target, forControlEvent: event)?.forEach { action in
                (target as NSObject).perform(Selector(action))
            }
        }
    }
    
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}


