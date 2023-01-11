//
//  ExtensionHelpers.swift
//  Data
//
//  Created by Leonardo Almeida on 10/01/23.
//

import Foundation

public extension Data {
    func toModel<T: Decodable>() -> T? {
        return try? JSONDecoder().decode(T.self, from: self)
    }
}
