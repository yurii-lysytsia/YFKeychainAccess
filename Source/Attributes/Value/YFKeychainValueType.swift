//
//  YFKeychainValueType.swift
//  Example
//
//  Created by Yuri Fox on 11.11.17.
//  Copyright © 2017 Yuri Lysytsia. All rights reserved.
//

import Security

/// Keychain value type key
enum YFKeychainValueType {
    
    /// A key whose value is the item's data.
    ///
    /// The corresponding value is of type CFData.  For keys and password items, the data is secret (encrypted) and may require the user to enter a password for access
    case data
    
    /// A key whose value is a reference to the item.
    ///
    /// The corresponding value, depending on the item class requested, is of type SecKeychainItem, SecKey, SecCertificate, or SecIdentity.
    case reference
    
    /// A key whose value is a persistent reference to the item
    ///
    /// The corresponding value is of type CFData. The bytes in this object can be stored by the caller and used on a subsequent invocation of the application (or even a different application) to retrieve the item referenced by it.
    case persistentReference
    
    var value: CFString {
        switch self {
        case .data: return kSecValueData
        case .reference: return kSecValueRef
        case .persistentReference: return kSecValuePersistentRef
        }
    }
}
