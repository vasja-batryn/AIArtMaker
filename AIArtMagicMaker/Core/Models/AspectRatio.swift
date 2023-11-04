//
//  AspectRatio.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 06.07.2023.
//

import Foundation

enum AspectRatio: String {
    
    // MARK: - Cases
    case oneToOne = "1:1"
    case threeToFour = "3:4"
    case fourToThree = "4:3"
    
    // MARK: - Public Properties
    var value: Double {
        switch self {
        case .oneToOne:
            return 1 / 1
        case .threeToFour:
            return 3 / 4
        case .fourToThree:
            return 4 / 3
        }
    }
}

// MARK: - CaseIterable
extension AspectRatio: CaseIterable { }

// MARK: - Identifiable
extension AspectRatio: Identifiable {
    
    var id: String { rawValue }
}
