//
//  YFKeychainAccess.swift
//  Example
//
//  Created by Yuri Fox on 09.11.17.
//  Copyright © 2017 Yuri Lysytsia. All rights reserved.
//

import Foundation
import Security

public class YFKeychainAccess {
    
    public private (set) var options: YFKeychainOptions
    public private (set) var keyPrefix: String?
    
    public init(options: YFKeychainOptions, keyPrefix: String? = nil) {
        self.options = options
        self.keyPrefix = keyPrefix
    }
    
    private func key(_ key: String) -> String {
        guard let keyPrefix = self.keyPrefix else {
            return "\(Bundle.main.bundleIdentifier ?? "YFKeychainAccess")\(key)"
        }
        return "\(keyPrefix)\(key)"
    }
    
}

// MARK: - Set
public extension YFKeychainAccess {

    func set(_ data: Data, forKey key: String, accessible: YFKeychainAccessible? = nil) throws {
        let _key = self.key(key)
        
        if try self.contains(forKey: _key) {
            try self.delete(forKey: key)
        }
        
        let query = self.options.attributes(data: data, forKey: _key, accessible: accessible)
        let status = YFKeychainItem.add(query)
        
        if status != .success {
            throw status
        }
        
    }

    func set(_ string: String, forKey key: String, accessible: YFKeychainAccessible? = nil) throws {
        
        guard let data = string.data(using: .utf8, allowLossyConversion: false) else {
            throw YFStatus.conversionError
        }
        
        try self.set(data, forKey: key, accessible: accessible)
        
    }
    
    func set(_ bool: Bool, forKey key: String, accessible: YFKeychainAccessible? = nil) throws {
        let bytes: [UInt8] = bool ? [1] : [0]
        let data = Data(bytes: bytes)
        try self.set(data, forKey: key, accessible: accessible)
    }

    func set(_ int: Int, forKey key: String, accessible: YFKeychainAccessible? = nil) throws {
        try self.set("\(int)", forKey: key, accessible: accessible)
    }

    func set(_ float: Float, forKey key: String, accessible: YFKeychainAccessible? = nil) throws {
        try self.set("\(float)", forKey: key, accessible: accessible)
    }
    
    func set(_ double: Double, forKey key: String, accessible: YFKeychainAccessible? = nil) throws {
        try self.set("\(double)", forKey: key, accessible: accessible)
    }
    
}

// MARK: - Update
extension YFKeychainAccess {

    public func contains(forKey key: String) throws -> Bool {
        let _key = self.key(key)
        let query = options.attributes(forKey: _key)
        let status = YFKeychainItem.copyMatching(query)
        
        switch status {
        case .success: return true
        case .itemNotFound: return false
        default: throw status
        }
        
    }
    
}

// MARK: - Get
extension YFKeychainAccess {

    public func data(forKey key: String) throws -> Data {
        let _key = self.key(key)
        
        let query = self.options.attributes(forKey: _key, matchLimit: .one, return: (type: .data, value: true))
        
        var dataTypeRef: AnyObject?

        let status = YFKeychainItem.copyMatching(query, result: &dataTypeRef)

        if status != .success {
            throw status
        }
        
        guard let data = dataTypeRef as? Data else {
            throw YFStatus.invalidData
        }
        
        return data
    }

    func string(forKey key: String) throws -> String {
        let data = try self.data(forKey: key)
        
        guard let string = String(data: data, encoding: .utf8) else {
            throw YFStatus.conversionError
        }
        
        return string
        
    }

    func bool(forKey key: String) throws -> Bool {
        guard let data = try self.data(forKey: key).first else {
            throw YFStatus.conversionError
        }
        
        return data == 1

    }
    
    func int(forKey key: String) throws -> Int {
        let string = try self.string(forKey: key)
        
        guard let int = Int(string) else {
            throw YFStatus.conversionError
        }
        
        return int
    }

    func float(forKey key: String) throws -> Float {
        let string = try self.string(forKey: key)
        
        guard let float = Float(string) else {
            throw YFStatus.conversionError
        }
        
        return float
    }
    
    func double(forKey key: String) throws -> Double {
        let string = try self.string(forKey: key)
        
        guard let double = Double(string) else {
            throw YFStatus.conversionError
        }
        
        return double
    }
    
}

// MARK: - Delete
extension YFKeychainAccess {

    func delete(forKey key: String) throws {
        let _key = self.key(key)
        let query = self.options.attributes(forKey: _key)
        let status = YFKeychainItem.delete(query)
        
        if status != .success && status != .itemNotFound {
            throw status
        }
        
    }

    func deleteAll() throws {
        
        let query = self.options.attributes(matchLimit: .all)
        let status = YFKeychainItem.delete(query)
        
        if status != .success && status != .itemNotFound {
            throw status
        }
        
    }

}
