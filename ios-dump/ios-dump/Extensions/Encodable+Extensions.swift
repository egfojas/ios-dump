//
//  Encodable+Extensions.swift
//  ios-dump
//
//  Created by Edgar Allan Fojas on 30/8/19.
//  Copyright © 2019 Edgar Allan Fojas. All rights reserved.
//

import Foundation

extension Encodable {
    func asJSON(encodingStrategy: JSONEncoder.KeyEncodingStrategy = .useDefaultKeys) throws -> [String: Any] {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = encodingStrategy
        
        let data = try encoder.encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
    
    func jsonValue(encodingStrategy: JSONEncoder.KeyEncodingStrategy = .useDefaultKeys) -> [String: Any]? {
        return try? asJSON(encodingStrategy: encodingStrategy)
    }
}
