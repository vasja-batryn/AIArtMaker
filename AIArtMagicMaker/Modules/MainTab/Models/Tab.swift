//
//  Tab.swift
//  AIArtMagicMaker
//
//  Created by Yurii Marhitych on 04.07.2023.
//

import Foundation

enum Tab: String {
    
    // MARK: - Cases
    case fromText
    case fromImage
    case myArts
    case settings
    
    // MARK: - Public Properties
    var title: String {
        switch self {
        case .fromText:
            return "From Text"
        case .fromImage:
            return "From Image"
        case .myArts:
            return "My Arts"
        case .settings:
            return "Settings"
        }
    }
    
    // MARK: - Public Methods
    func imageName(isActive: Bool = false) -> String {
        rawValue + (isActive ? "Active" : "")
    }
}

// MARK: - CaseIterable
extension Tab: CaseIterable { }

// MARK: - Hashable
extension Tab: Hashable { }

// MARK: - Identifiable
extension Tab: Identifiable {
    
    var id: String { rawValue }
}
