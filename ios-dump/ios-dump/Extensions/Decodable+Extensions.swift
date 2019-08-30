//
//  Decodable+Extensions.swift
//  ios-dump
//
//  Created by Edgar Allan Fojas on 30/8/19.
//  Copyright © 2019 Edgar Allan Fojas. All rights reserved.
//

import Foundation

extension Decodable {
    
    /// Initialies the Decodable object from a JSON dictionary.
    ///
    /// - Parameter json: JSON dictionary.
    /// - Throws: throws an error if the initialization fails.
    init(fromJSON json: [String: Any]) throws {
        let decoder = JSONDecoder()
        let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        self = try decoder.decode(Self.self, from: data)
    }
}
