import Foundation

//usando extensao de protocol para trasnformar qualquer model para Data

public protocol Model: Encodable {}

public extension Model {
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
