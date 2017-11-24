//
//  YFKeychainItem.swift
//  Example
//
//  Created by Yuri Fox on 12.11.17.
//  Copyright © 2017 Yuri Lysytsia. All rights reserved.
//

import Security

struct YFKeychainItem {
    
    @discardableResult
    static func add(_ attributes: [YFKeychainAttributes : Any], result: UnsafeMutablePointer<CFTypeRef?>? = nil) -> YFStatus {
        
        let query = attributes.CFDictionary
        let status = SecItemAdd(query, result)
        return YFStatus(status)
        
    }
    
    @discardableResult
    static func copyMatching(_ attributes: [YFKeychainAttributes : Any], result: UnsafeMutablePointer<CFTypeRef?>? = nil) -> YFStatus {
        
        let query = attributes.CFDictionary
        let status = SecItemCopyMatching(query, result)
        return YFStatus(status)
        
    }
    
    @discardableResult
    static func update(_ attributes: [YFKeychainAttributes : Any], _ attributesToUpdate: [YFKeychainAttributes : Any]) -> YFStatus {
        
        let query = attributes.CFDictionary
        let queryToUpdate = attributesToUpdate.CFDictionary
        let status = SecItemUpdate(query, queryToUpdate)
        return YFStatus(status)
        
    }
    
    @discardableResult
    static func delete(_ attributes: [YFKeychainAttributes : Any]) -> YFStatus {
        
        let query = attributes.CFDictionary
        let status = SecItemDelete(query)
        return YFStatus(status)
        
    }
    
}
