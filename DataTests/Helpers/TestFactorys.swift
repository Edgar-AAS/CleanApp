import Foundation

func makeInvalidData() -> Data {
    return Data("invalid_data".utf8)
}

func makeValidData() -> Data {
    return Data("{\"name\":\"Edgar\"}".utf8)
}

func makeUrl() -> URL {
    return URL(string: "http://any-url.com")!
}
