//
//  YFKeychainAttributes.swift
//  Example
//
//  Created by Yuri Fox on 11.11.17.
//  Copyright © 2017 Yuri Lysytsia. All rights reserved.
//

import Security

enum YFKeychainAttributes {
    
    /**
     A dictionary key whose value is the item's class.
     Possible values for this key are listed in Item Class Values.
     */
    case `class`
    
    /**
     A key whose value indicates when a keychain item is accessible.
     
     A CFTypeRef (opaque) value that indicates when your app needs access to the data in a keychain item. You should choose the most restrictive option that meets your app’s needs so that the system can protect that item to the greatest extent possible. For a list of possible values, Accessibility Values.
     
     This attribute is available for macOS keychain items only when the kSecAttrSynchronizable attribute is also present. If both attributes are specified on either macOS or iOS, the value for the kSecAttrAccessible key may only be one whose name does not end with ThisDeviceOnly, as those cannot sync to another device.
     
     The app must provide the contents of the keychain item (kSecValueData) when changing this attribute in iOS 4 and earlier.
     */
    case accessible
    
    /**
     A key whose value in an access control object indicating access control settings for the item.
     
     The corresponding value is a SecAccessControl object, created with the SecAccessControlCreateWithFlags(_:_:_:_:) function, containing access control conditions for the item.
     
     This attribute is mutually exclusive with the kSecAttrAccess attribute.
     */
    case accessControl
    
    /**
     A key whose value is a string indicating the access group an item is in.
     
     The corresponding value is of type CFString and indicates which access group an item is in.
     
     Access groups are used to share keychain items among two or more apps. For apps to share a keychain item, they must have a common access group. The list of access groups to which an app belongs is formed as the collection of the strings in the app’s keychain-access-groups entitlement, the application identifier string, and starting in iOS 8.0, the strings in the application-groups entitlement, in that order. The app adding a shared item to the keychain specifies the shared access group name as the value for this key in the dictionary passed to the SecItemAdd(_:_:) function. Specifying a string for this key that is not among the app’s access groups (including the empty string) generates an error. When the app omits the access group key from the dictionary entirely, Keychain Services defaults to using the app’s first access group, which is the application identifier if no other entitlements are specified, and in which case the item is only accessible to the app creating the item, since no other app can be in that group.
     
     An application can be a member of any number of access groups. By default, the SecItemUpdate(_:_:), SecItemDelete(_:), and SecItemCopyMatching(_:_:) functions search all the access groups an application is a member of. Include this key in the search dictionary for these functions to specify which access group is searched.
     
     A keychain item can be in only a single access group.
     
     This attribute is available for macOS keychain items only when the kSecAttrSynchronizable attribute is also present.
     */
    case accessGroup
    
    /**
     A key whose value indicates the item's creation date.
     
     The corresponding value is of type CFDate and represents the date the item was created. Read only.
     */
    case creationDate
    
    /**
     A key whose value indicates the item's last modification date.
     
     The corresponding value is of type CFDate and represents the last time the item was updated. Read only.
     */
    case modificationDate
    
    /**
     A key whose value is a string indicating the item's description.
     
     The corresponding value is of type CFString and specifies a user-visible string describing this kind of item (for example, "Disk image password").
     */
    case description
    
    /**
    A key whose value is a string indicating a comment associated with the item.
    The corresponding value is of type CFString and contains the user-editable comment for this item.
    */
    case comment
    
    /**
     A key whose value indicates the item's creator.
     
     The corresponding value is of type CFNumber and represents the item's creator. This number is the unsigned integer representation of a four-character code (for example, 'aCrt').
     */
    case creator
    
    /**
     A key whose value indicates the item's type.
     
     The corresponding value is of type CFNumber and represents the item's type. This number is the unsigned integer representation of a four-character code (for example, 'aTyp').
     */
    case type
    
    /**
     A key whose value is a string indicating the item's label.
     
     The corresponding value is of type CFString and contains the user-visible label for this item.
     On key creation, if not explicitly specified, this attribute defaults to NULL.
     */
    case label
    
    /**
     A key whose value is a Boolean indicating the item's visibility.
     
     The corresponding value is of type CFBoolean and is kCFBooleanTrue if the item is invisible (that is, should not be displayed).
     */
    case isInvisible
    
    /**
     A key whose value is a Boolean indicating whether the item has a valid password.
     
     The corresponding value is of type CFBoolean and indicates whether there is a valid password associated with this keychain item. This is useful if your application doesn't want a password for some particular service to be stored in the keychain, but prefers that it always be entered by the user.
     */
    case isNegative
    
    /**
     A key whose value is a string indicating the item's account name.
     
     The corresponding value is of type CFString and contains an account name. Items of class kSecClassGenericPassword and kSecClassInternetPassword have this attribute.
     */
    case account
    
    /**
     A key whose value is a string indicating the item's service.
     
     The corresponding value is a string of type CFString that represents the service associated with this item. Items of class kSecClassGenericPassword have this attribute.
     */
    case service
    
    /**
     A key whose value indicates the item's user-defined attributes.
     
     The corresponding value is of type CFData and contains a user-defined attribute. Items of class kSecClassGenericPassword have this attribute.
     */
    case generic
    
    /**
     A key whose value is a string indicating whether the item is synchronized through iCloud.
     
     The corresponding value is of type CFString and indicates whether the item in question is synchronized to other devices through iCloud. To add a new synchronizable item, or to obtain synchronizable results from a query, supply this key with a value of kCFBooleanTrue. If the key is not supplied, or has a value of kCFBooleanFalse, then no synchronizable items are added or returned. Use kSecAttrSynchronizableAny to query for both synchronizable and non-synchronizable results.
     
     A keychain item created in macOS with this attribute behaves like an iOS keychain item. For example, you share the item between apps using Access Groups instead of Access Control Lists.
     The following caveats apply when you specify the kSecAttrSynchronizable key:
     
     * Updating or deleting items using the kSecAttrSynchronizable key will affect all copies of the item, not just the one on your local device. Be sure that it makes sense to use the same password on all devices before making a password synchronizable.
     * Only password items can be synchronized. Keychain syncing is not supported for certificates or cryptographic keys.
     * Items stored or obtained using the kSecAttrSynchronizable key cannot specify SecAccess based access control with kSecAttrAccess. If a password is intended to be shared between multiple applications, the kSecAttrAccessGroup key must be specified, and each application using this password must have a keychain-access-groups entitlement with the specified access group value.
     * Items stored or obtained using the kSecAttrSynchronizable key may not also specify a kSecAttrAccessible value that is incompatible with syncing (namely, those whose names end with ThisDeviceOnly.)
     * Items stored or obtained using the kSecAttrSynchronizable key cannot be specified by reference. Use only kSecReturnAttributes and/or kSecReturnData to retrieve results.
     * Do not use persistent references to synchronizable items. They cannot be moved between devices, and may not resolve if the item is modified on some other device.
     * When specifying a query that uses the kSecAttrSynchronizable key, search keys are limited to the item's class and attributes. The only search constant that may be used is kSecMatchLimit; other constants using the kSecMatch prefix are not supported.
     */
    case synchronizable

    case matchLimit
    
    case valueType(YFKeychainValueType)
    case returnType(YFKeychainReturnType)
    
    var value: String {
        let _value: CFString
        
        switch self {
        case .class: _value = kSecClass
        case .accessControl: _value = kSecAttrAccessControl
        case .accessGroup: _value = kSecAttrAccessGroup
        case .accessible: _value = kSecAttrAccessible
        case .creationDate: _value = kSecAttrCreationDate
        case .modificationDate: _value = kSecAttrModificationDate
        case .description: _value = kSecAttrDescription
        case .comment: _value = kSecAttrComment
        case .creator: _value = kSecAttrCreator
        case .type: _value = kSecAttrType
        case .label: _value = kSecAttrLabel
        case .isInvisible: _value = kSecAttrIsInvisible
        case .isNegative: _value = kSecAttrIsNegative
        case .account: _value = kSecAttrAccount
        case .service: _value = kSecAttrService
        case .generic: _value = kSecAttrGeneric
        case .synchronizable: _value = kSecAttrSynchronizable
        
        case .matchLimit: _value = kSecMatchLimit
            
        case .valueType(let valueType): _value = valueType.value
        case .returnType(let returnType): _value = returnType.value   
        }
        
        return _value as String
    }
    
}

extension YFKeychainAttributes: Hashable {
    
    static func ==(lhs: YFKeychainAttributes, rhs: YFKeychainAttributes) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }

    var hashValue: Int {
        return self.value.hashValue
    }

}
