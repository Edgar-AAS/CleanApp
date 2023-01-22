import XCTest
import UIKit
@testable import UI

class SignUpViewControllerTests: XCTestCase {
    func test_loading_is_hidden_on_start() {
        let storyboard = UIStoryboard(name: "SignUp", bundle: Bundle(for: SignUpViewController.self))
        let sut = storyboard.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.loadingIndicator.isAnimating, false)
    }
}
