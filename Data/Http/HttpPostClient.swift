import Foundation

//É melhor tem varias interfaces pequenas  do que um interface grande
//Ajuda nos teste unitários
//Desacoplando o nosso caso de uso. Injetando o protocol

public protocol HttpPostClient {
    func post(to url: URL, with data: Data?, completion: @escaping (HttpError) -> Void)
}
