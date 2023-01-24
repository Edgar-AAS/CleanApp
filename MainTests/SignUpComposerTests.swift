import XCTest
import Main

class SignUpComposerTests: XCTestCase {
    func test_ui_presentation_integration() {
        let sut = SignUpComposer.composeViewControllerWith(addAccount: AddAccountSpy())
        checkMemoryLeak(for: sut)
    }
}
