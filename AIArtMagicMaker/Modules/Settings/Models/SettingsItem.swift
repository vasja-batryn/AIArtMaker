//
//  SettingsItem.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 21.06.2023.
//

import Foundation

enum SettingsItem: String, CaseIterable {
    
    // MARK: - Cases
    case restore
    case support
    case rate
    case termsOfUse
    case privacyPolicy
    case complaint
}

// MARK: - CustomStringConvertible
extension SettingsItem: CustomStringConvertible {
    
    var description: String {
        switch self {
            case .restore:
                return "Restore"
            case .support:
                return "Support & Contact Us"
            case .rate:
                return "Rate Our App!"
            case .termsOfUse:
                return "Terms of Use"
            case .privacyPolicy:
                return "Privacy Policy"
            case .complaint:
                return "Submit a Сomplaint"
        }
    }
}

// MARK: - Identifiable
extension SettingsItem: Identifiable {
    
    var id: String { rawValue }
}
