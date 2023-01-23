import XCTest
import Main

class SignUpIntegrationTests: XCTestCase {
    func test_ui_presentation_integration() {
        debugPrint("==============================")
        debugPrint(Environment.variable(.apiBaseUrl))
        debugPrint("==============================")
        let sut = SignUpComposer.composeViewControllerWith(addAccount: AddAccountSpy())
        checkMemoryLeak(for: sut)
    }
}
