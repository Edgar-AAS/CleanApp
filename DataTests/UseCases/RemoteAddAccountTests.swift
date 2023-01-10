import XCTest
import Domain
import Data

//Principio de segregação de interface: As interfaces devem ser pequenas
class RemoteAddAccountTests: XCTestCase {
    func test_add_should_call_httpClient_with_correct_url() {
        //todos os teste devem ter acesso ao httpClientSpy
        let url = URL(string: "http://any-url.com")!
        let (sut, httpClientSpy) = makeSut(url: url)
        sut.add(addAccountModel: makeAddAccountModel())
        //verificar o valor a quantidade que foi chamada
        XCTAssertEqual(httpClientSpy.urls, [url])
    }
    
    func test_add_should_call_httpClient_with_correct_data() {
        let (sut, httpClientSpy) = makeSut()
        let addAccountModel = makeAddAccountModel()
        sut.add(addAccountModel: addAccountModel)
        XCTAssertEqual(httpClientSpy.data, addAccountModel.toData())
    }
}

extension RemoteAddAccountTests {
    //Design pattern Factory
    //Se o AddAccountModel mudar seus parametros no futuro
    //evita que que o seja necessario trocar todos os testes que o tenha
    //como eu preciso ter acesso ao meu spy para fazer a comparação dos testes
    //cria um factory do meu sut passando a tupla (sut, httpClientSpy) como retorno
    
    func makeSut(url: URL = URL(string: "http://any-url.com")!) -> (sut: RemoteAddAccount, httpClientSpy: HttpClientSpy)  {
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAddAccount(url: url, httpClient: httpClientSpy)
        return (sut, httpClientSpy)
    }
    
    func makeAddAccountModel() -> AddAccountModel {
        return AddAccountModel(
            name: "paulo",
            email: "paulo@outlook.com",
            password: "password123",
            passwordConfirmation: "password123"
        )
    }
    
    class HttpClientSpy: HttpPostClient {
        var urls = [URL]()
        var data: Data?
        
        func post(to url: URL, with data: Data?) {
            self.urls.append(url)
            self.data = data
        }
    }
}