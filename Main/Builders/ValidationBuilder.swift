import Foundation
import Presentation
import Validation

public final class ValidationBuilder {
    private static var instance: ValidationBuilder?
    private var fieldName: String!
    private var fieldLabel: String!
    private var validations = [Validation]()
    
    private init() {}
    
    public static func field(_ name: String) -> ValidationBuilder {
        instance = ValidationBuilder()
        instance!.fieldName = name
        instance!.fieldLabel = name
        return instance!
    }
    
    public func label(_ name: String) -> ValidationBuilder {
        fieldLabel = name
        return self
    }
    
    public func required() -> ValidationBuilder {
        validations.append(RequiredFieldValidation(fieldName: fieldName, fieldLabel: fieldLabel))
        return self
    }
    
    public func email() -> ValidationBuilder {
        validations.append(EmailValidation(fieldName: fieldName, fieldLabel: fieldLabel, emailValidator: makeEmailValidatorAdapter()))
        return self
    }
    
    func sameAs(_ fieldNameToCompare: String) -> ValidationBuilder {
        validations.append(CompareFieldsValidation(fieldName: fieldName, fieldLabel: fieldLabel, fieldNameToCompare: fieldNameToCompare))
        return self
    }
    
    public func build() -> [Validation] {
        return validations
    }
}
