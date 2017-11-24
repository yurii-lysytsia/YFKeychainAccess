//
//  YFKeychainMatchLimit.swift
//  Example
//
//  Created by Yuri Fox on 11.11.17.
//  Copyright © 2017 Yuri Lysytsia. All rights reserved.
//

import Security

/// A key whose value indicates the match limit.
///
/// The corresponding value is of type CFNumber. If provided, this value specifies the maximum number of results to return or otherwise act upon.
enum YFKeychainMatchLimit {
    
    /// A value that corresponds to matching exactly one item.
    case one
    
    /// A value that corresponds to matching an unlimited number of items.
    case all
    
    var value: String {
        let _value: CFString
        
        switch self {
        case .one: _value = kSecMatchLimitOne
        case .all: _value = kSecMatchLimitAll
        }
        
        return _value as String
    }
    
}
