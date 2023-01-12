import Foundation

//É melhor tem varias interfaces pequenas  do que um interface grande
//Ajuda nos teste unitários
//Desacoplando o nosso caso de uso. Injetando o protocol
//resultado do client genérico
//Principio de segregação de interface: As interfaces devem ser pequenas

public protocol HttpPostClient {
    func post(to url: URL, with data: Data?, completion: @escaping (Result<Data?, HttpError>) -> Void)
}
