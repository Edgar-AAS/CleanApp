import XCTest
import Presentation
import Validation

class EmailValidatorAdapterTests: XCTestCase {
    func test_invalid_emails() {
        let sut = makeSut()
        XCTAssertFalse(sut.isValid(email: "rr"))
        XCTAssertFalse(sut.isValid(email: "rr@"))
        XCTAssertFalse(sut.isValid(email: "rr@rr"))
        XCTAssertFalse(sut.isValid(email: "rr@rr."))
        XCTAssertFalse(sut.isValid(email: "@rr.com"))
    }
    
    func test_valid_emails() {
        let sut = makeSut()
        XCTAssertTrue(sut.isValid(email: "edgar@gmail.com"))
        XCTAssertTrue(sut.isValid(email: "edgar@hotmail.com"))
        XCTAssertTrue(sut.isValid(email: "edgar@outlook.com"))
        XCTAssertTrue(sut.isValid(email: "edgar@live.de"))
        XCTAssertTrue(sut.isValid(email: "edgar_almd@gmail.com"))
    }
}

extension EmailValidatorAdapterTests {
    func makeSut() -> EmailValidatorAdapter {
        return EmailValidatorAdapter()
    }
}
