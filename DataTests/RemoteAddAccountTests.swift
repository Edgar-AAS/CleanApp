import XCTest

class RemoteAddAccount {
    private let url: URL
    private let httpClient: HttpPostClient
    
    init(url: URL, httpClient: HttpPostClient) {
        self.url = url
        self.httpClient = httpClient
    }
    
    func add() {
        httpClient.post(url: url)
    }
}

//Principio de segregação de interface: As interfaces devem ser pequenas
//É melhor tem varias interfaces pequenas  do que um interface grande
//Ajuda nos teste unitários
//Desacoplando o nosso caso de uso. Injetando o protocol

protocol HttpPostClient {
    func post(url: URL)
}

class RemoteAddAccountTests: XCTestCase {
    func test_add_should_call_httpClient_with_correct_url() {
        let url = URL(string: "http://any-url.com")!
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAddAccount(url: url, httpClient: httpClientSpy)
        sut.add()
        XCTAssertEqual(httpClientSpy.url, url)
    }
}

extension RemoteAddAccountTests {
    class HttpClientSpy: HttpPostClient {
        var url: URL?
        
        func post(url: URL) {
            self.url = url
        }
    }
}
