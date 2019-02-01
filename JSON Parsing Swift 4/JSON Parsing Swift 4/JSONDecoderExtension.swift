//
//  JSONDecoderExtension.swift
//  JSON Parsing Swift 4
//
//  Created by Richard EV Simpson on 01/02/2019.
//  Copyright © 2019 REVS. All rights reserved.
//

import Foundation

extension JSONDecoder {
    var decoderWithStrategy: JSONDecoder {
        get {
            self.dateDecodingStrategy = .formatted(DateParser.datumFormatParser)
            self.keyDecodingStrategy = .convertFromUpperCamelCase
            return self
        }
    }
}

extension JSONDecoder.KeyDecodingStrategy {
    
    static var convertFromUpperCamelCase: JSONDecoder.KeyDecodingStrategy {
        return  .custom {
            
            var key = AnyCodingKey($0.last!)
            
            // Eerste letter lowercase maken omdat de JSON elementen met een hoofdletter beginnen en de struct niet.
            if let firstChar = key.stringValue.first {
                let i = key.stringValue.startIndex
                key.stringValue.replaceSubrange(i ... i, with: String(firstChar).lowercased()
                )
            }
            return key
        }
    }
}

struct AnyCodingKey : CodingKey {
    
    var stringValue: String
    var intValue: Int?
    
    init(_ base: CodingKey) {
        self.init(stringValue: base.stringValue, intValue: base.intValue)
    }
    
    init(stringValue: String) {
        self.stringValue = stringValue
    }
    
    init(intValue: Int) {
        self.stringValue = "\(intValue)"
        self.intValue = intValue
    }
    
    init(stringValue: String, intValue: Int?) {
        self.stringValue = stringValue
        self.intValue = intValue
    }
}


// Als je inline een custom decoder wilt toevoegen kun je het doen zoals hieronder:

//let encoder = JSONDecoder().decoderWithStrategy
//
//encoder.keyDecodingStrategy = .custom({ (keys) -> CodingKey in
//    var key : AnyCodingKey = AnyCodingKey(keys.last!)
//
//    // lowercase first letter
//    if let firstChar = key.stringValue.first {
//        let i = key.stringValue.startIndex
//        key.stringValue.replaceSubrange(i ... i, with: String(firstChar).lowercased()
//        )
//    }
//    return  key
//})
//
// let result = try encoder.decode(/// strutct die je wilt decoden ///DemoStruct.self, from: data)



