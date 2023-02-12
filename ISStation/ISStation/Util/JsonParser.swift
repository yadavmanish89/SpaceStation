//
//  JsonParser.swift
//  ISStation
//
//  Created by manish yadav on 2/11/23.
//

import Foundation

class JsonParser {
    static func getModelFor<T>(data: Data, model: T) -> T? where T: (Decodable) {
        let jsonDecoder = JSONDecoder()
        do {
            let responseModel = try jsonDecoder.decode(T.self, from: data)
            return responseModel
        } catch(let err) {
            debugPrint("Errow while parsing:\(err.localizedDescription)")
        }
        return nil
    }
}
