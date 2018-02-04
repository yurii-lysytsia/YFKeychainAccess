//
//  YFKeychainAccessible.swift
//  Example
//
//  Created by Yuri Fox on 09.11.17.
//  Copyright © 2017 Yuri Lysytsia. All rights reserved.
//

import Security

/// A key whose value indicates when a keychain item is accessible.
public enum YFKeychainAccessible {
    
    /// The data in the keychain item can always be accessed regardless of whether the device is locked.
    ///
    /// This is not recommended for application use.
    ///
    /// if *thisDeviceOnly* is **true** items with this attribute migrate to a new device when using encrypted backups **else** items with this attribute do not migrate to a new device. Thus, after restoring from a backup of a different device, these items will not be present.
    case always(thisDeviceOnly: Bool)
    
    /// The data in the keychain item cannot be accessed after a restart until the device has been unlocked once by the user.
    ///
    /// After the first unlock, the data remains accessible until the next restart. This is recommended for items that need to be accessed by background applications.
    ///
    /// if *thisDeviceOnly* is **true** items with this attribute migrate to a new device when using encrypted backups **else** items with this attribute do not migrate to a new device. Thus, after restoring from a backup of a different device, these items will not be present.
    case afterFirstUnlock(thisDeviceOnly: Bool)
    
    /// The data in the keychain item can be accessed only while the device is unlocked by the user.
    ///
    /// This is recommended for items that need to be accessible only while the application is in the foreground.
    ///
    /// if *thisDeviceOnly* is **true** items with this attribute migrate to a new device when using encrypted backups **else** items with this attribute do not migrate to a new device. Thus, after restoring from a backup of a different device, these items will not be present.
    case whenUnlocked(thisDeviceOnly: Bool)
    
    /// The data in the keychain can only be accessed when the device is unlocked. Only available if a passcode is set on the device.
    ///
    /// This is recommended for items that only need to be accessible while the application is in the foreground. Items with this attribute never migrate to a new device. After a backup is restored to a new device, these items are missing. No items can be stored in this class on devices without a passcode. Disabling the device passcode causes all items in this class to be deleted.
    ///
    /// This device only
    case whenPasscodeSet //ThisDeviceOnly
    
    public var value: String {
        
        var _value: CFString
        
        switch self {
        case .always(thisDeviceOnly: let isOnly):
            _value = isOnly ? kSecAttrAccessibleAlwaysThisDeviceOnly : kSecAttrAccessibleAlways
            
        case .afterFirstUnlock(thisDeviceOnly: let isOnly):
            _value = isOnly ? kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly : kSecAttrAccessibleAfterFirstUnlock

        case .whenUnlocked(thisDeviceOnly: let isOnly):
            _value = isOnly ? kSecAttrAccessibleWhenUnlockedThisDeviceOnly : kSecAttrAccessibleWhenUnlocked
            
        case .whenPasscodeSet:
            _value = kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly
        }
        
        return _value as String
    }
    
    public var synchronizable: Bool {
        switch self {
        case .afterFirstUnlock(thisDeviceOnly: let isOnly): return !isOnly
        case .always(thisDeviceOnly: let isOnly): return !isOnly
        case .whenUnlocked(thisDeviceOnly: let isOnly): return !isOnly
        case .whenPasscodeSet: return false
        }
    }
    
}
