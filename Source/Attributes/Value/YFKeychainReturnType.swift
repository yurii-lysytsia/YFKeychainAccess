//
//  YFKeychainReturnType.swift
//  Example
//
//  Created by Yuri Fox on 11.11.17.
//  Copyright © 2017 Yuri Lysytsia. All rights reserved.
//

import Security

/// Keychain return type key.
enum YFKeychainReturnType {
    
    /// A key whose value is a Boolean indicating whether or not to return item data.
    ///
    /// The corresponding value is of type CFBoolean. A value of kCFBooleanTrue indicates that the data of an item should be returned in the form of a CFData object.
    ///
    /// For keys and password items, data is secret (encrypted) and may require the user to enter a password for access. For key items, the resulting data has the same format as the return value of the function SecKeyCopyExternalRepresentation(_:_:).
    case data
    
    /// A key whose value is a Boolean indicating whether or not to return item attributes.
    ///
    /// The corresponding value is of type CFBoolean. A value of kCFBooleanTrue indicates that a dictionary of the (unencrypted) attributes of an item should be returned in the form of a CFDictionary using the keys and values defined in Item Attribute Keys and Values.
    case attributes
    
    /// A key whose value is a Boolean indicating whether or not to return item reference.
    ///
    /// The corresponding value is of type CFBoolean. A value of kCFBooleanTrue indicates that a reference should be returned. Depending on the item class requested, the returned references may be of type SecKeychainItem, SecKey, SecCertificate, SecIdentity, or CFData.
    case reference
    
    /// A key whose value is a Boolean indicating whether or not to return item persistentReference.
    ///
    /// The corresponding value is of type CFBoolean. A value of kCFBooleanTrue indicates that a persistent reference to an item should be returned as a CFData object. Unlike normal references, a persistent reference may be stored on disk or passed between processes.
    case persistentReference
    
    var value: CFString {
        switch self {
        case .data: return kSecReturnData
        case .attributes: return kSecReturnAttributes
        case .reference: return kSecReturnRef
        case .persistentReference: return kSecReturnPersistentRef
        }
    }
    
}
