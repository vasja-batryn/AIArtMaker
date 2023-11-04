//
//  AccessAlertType.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 18.07.2023.
//

import Foundation

enum AccessAlertType: String {

    // MARK: - Cases
    case camera
    case photoLibrary

    // MARK: - Public Properties
    var title: String {
        switch self {
        case .camera:
            return "Allow access to Camera in Settings"
        case .photoLibrary:
            return "Allow access to Photo Library in Settings"
        }
    }

    var message: String {
        switch self {
        case .camera:
            return "AI Art Magic Maker -> Camera -> On"
        case .photoLibrary:
            return "AI Art Magic Maker -> Photos -> All Photos"
        }
    }
}

// MARK: - Identifiable
extension AccessAlertType: Identifiable {
    var id: String { rawValue }
}
