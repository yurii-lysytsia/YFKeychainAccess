//
//  YFKeychainItemClass.swift
//  Example
//
//  Created by Yuri Fox on 11.11.17.
//  Copyright © 2017 Yuri Lysytsia. All rights reserved.
//

import Security

public enum YFKeychainItemClass {
    
    /// The value that indicates a generic password item.
    case genericPassword
    
    /// The value that indicates an Internet password item.
    case internetPassword
    
    /// The value that indicates an identity item.
    ///
    /// An identity is a certificate paired with its associated private key. Because an identity is the combination of a private key and a certificate, this class shares attributes of both kSecClassKey and kSecClassCertificate.
    case identity
    
    /// The value that indicates a certificate item.
    case certificate
    
    /// The value that indicates a cryptographic key item.
    case key
    
    var value: String {
        let _value: CFString
        
        switch self {
        case .genericPassword: _value = kSecClassGenericPassword
        case .internetPassword: _value = kSecClassInternetPassword
        case .identity: _value = kSecClassIdentity
        case .certificate: _value = kSecClassCertificate
        case .key: _value = kSecClassKey
        }
        
        return _value as String
    }
    
    init?(value: String) {
        switch value as CFString {
        case kSecClassGenericPassword: self = .genericPassword
        case kSecClassInternetPassword: self = .internetPassword
        case kSecClassIdentity: self = .identity
        case kSecClassCertificate: self = .certificate
        case kSecClassKey: self = .key
        default: return nil
        }
    }
    
}

// MARK: - CustomStringConvertible
extension YFKeychainItemClass: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .genericPassword: return "YFKeychainItemClassGenericPassword"
        case .internetPassword: return "YFKeychainItemClassInternetPassword"
        case .identity: return "YFKeychainItemClassIdentity"
        case .certificate: return "YFKeychainItemClassCertificate"
        case .key: return "YFKeychainItemClassKey"
        }
    }
    
}
