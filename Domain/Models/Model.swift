import Foundation

//usando extensao de protocol para transformar qualquer model para Data
public protocol Model: Codable, Equatable {}

public extension Model {
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
