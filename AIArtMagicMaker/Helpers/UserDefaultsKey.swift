//
//  UserDefaultsKey.swift
//  AIArtMagicMaker
//
//  Created by Yurii Marhitych on 03.07.2023.
//

import Foundation

enum UserDefaultsKey: String {
    
    // MARK: - Cases
    case apphudUserID
    case showOnboarding
}

// MARK: - UserDefaults+UserDefaultsKey
extension UserDefaults {

    func set(value: Any?, forKey key: UserDefaultsKey) {
        setValue(value, forKey: key.rawValue)
    }
    
    func string(forKey key: UserDefaultsKey) -> String? {
        value(forKey: key.rawValue) as? String
    }
}
