import XCTest
import Presentation
import Domain

class LoginPresenterTests: XCTestCase {
    func test_login_should_call_validation_with_correct_values() {
        let validationSpy = ValidationSpy()
        let sut = makeSut(validation: validationSpy)
        let viewModel = makeLoginViewModel()
        sut.login(viewModel: viewModel)
        XCTAssertTrue(NSDictionary(dictionary: validationSpy.data!).isEqual(to: viewModel.toJson()!))
    }
    
    func test_login_should_show_error_messsage_if_validation_fails() {
        let alertViewSpy = AlertViewSpy()
        let validationSpy = ValidationSpy()
        let sut = makeSut(alertView: alertViewSpy, validation: validationSpy)
        let exp = expectation(description: "waiting")
        alertViewSpy.observe { viewModel in
            XCTAssertEqual(viewModel, AlertViewModel(title: "Erro de validação", message: "Error"))
            exp.fulfill()
        }
        validationSpy.simulateError()
        sut.login(viewModel: makeLoginViewModel())
        wait(for: [exp], timeout: 1)
    }
    
    func test_login_should_call_authentication_with_correct_values() {
        let authenticationSpy = AuthenticationSpy()
        let sut = makeSut(authentication: authenticationSpy)
        let viewModel = makeLoginViewModel()
        sut.login(viewModel: viewModel)
        XCTAssertEqual(authenticationSpy.authenticationModel, viewModel.toAuthenticationModel())
    }
    
    func test_login_should_show_error_generic_messsage_if_authentication_fails() {
        let alertViewSpy = AlertViewSpy()
        let authenticationSpy = AuthenticationSpy()
        let sut = makeSut(authentication: authenticationSpy, alertView: alertViewSpy)
        let exp = expectation(description: "waiting")
        alertViewSpy.observe { viewModel in
            XCTAssertEqual(viewModel, AlertViewModel(title: "Erro", message: "Algo inesperado aconteceu tente novamente em alguns instantes"))
            exp.fulfill()
        }
        sut.login(viewModel: makeLoginViewModel())
        authenticationSpy.completeWithError(.unexpected)
        wait(for: [exp], timeout: 1)
    }
}

extension LoginPresenterTests {
    func makeSut(authentication: AuthenticationSpy = AuthenticationSpy(), alertView: AlertViewSpy = AlertViewSpy(), validation: ValidationSpy = ValidationSpy(), file: StaticString = #filePath, line: UInt = #line) -> LoginPresenter {
        let sut = LoginPresenter(authentication: authentication, alertView: alertView, validation: validation)
        checkMemoryLeak(for: sut, file: file, line: line)
        return sut
    }
}
