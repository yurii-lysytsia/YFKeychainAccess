//
//  YFKeychainOptions.swift
//  Example
//
//  Created by Yuri Fox on 09.11.17.
//  Copyright © 2017 Yuri Lysytsia. All rights reserved.
//

import Foundation
import Security

public struct YFKeychainOptions {
    
    public let itemClass: YFKeychainItemClass
    
    public init(itemClass: YFKeychainItemClass = .genericPassword) {
        self.itemClass = itemClass
    }
    
}

extension YFKeychainOptions {
    
    private var query: [YFKeychainAttributes : Any] {
        
        let _query: [YFKeychainAttributes : Any] = [
            .class : self.itemClass.value,
        ]
        
        return _query
        
    }
    
    func attributes(data: Data? = nil, forKey key: String? = nil, accessible: YFKeychainAccessible? = nil) -> [YFKeychainAttributes : Any] {
        
        var _query = self.query
        _query[.accessible] = accessible?.value
        _query[.synchronizable] = accessible?.synchronizable
        _query[.account] = key
        _query[.valueType(.data)] = data
        return _query
        
    }
    
    func attributes(forKey key: String, matchLimit: YFKeychainMatchLimit, return returnTypeAndValue: (type: YFKeychainReturnType, value: Any)) -> [YFKeychainAttributes : Any] {
        
        var _query = self.attributes(forKey: key)
        _query[.matchLimit] = matchLimit.value
        _query[.returnType(returnTypeAndValue.type)] = returnTypeAndValue.value
        return _query
        
    }

    func attributes(matchLimit: YFKeychainMatchLimit) -> [YFKeychainAttributes : Any] {
        
        var _query = self.attributes()
        _query[.matchLimit] = matchLimit
        return _query
        
    }
    
}

extension Dictionary where Key == YFKeychainAttributes, Value == Any {
    
    var dictionary: [String : Any] {
        var dictionary: [String : Any] = [:]
        
        for (key, value) in self {
            dictionary[key.value] = value
        }
        
        return dictionary
    }
    
    var CFDictionary: CFDictionary {
        return self.dictionary as CFDictionary
    }
    
}

