//
//  LinearGradient+Ext.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 20.06.2023.
//

import SwiftUI

// MARK: - Constants
extension LinearGradient {
    
    static let primaryGradient = LinearGradient(
        gradient: Gradient(colors: [.primaryGradient, .secondaryGradient]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    static let pageIndicatorInactive = LinearGradient(
        gradient: Gradient(colors: [.secondaryBackground, .secondaryBackground]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    static let pageIndicatorActive = LinearGradient(
        gradient: Gradient(colors: [.tertiaryGradient, .quaternaryGradient]),
        startPoint: UnitPoint(x: -0.5076, y: 1),
        endPoint: UnitPoint(x: 1.7028, y: 0)
    )

    static let paywallItemInactive = LinearGradient(
        gradient: Gradient(colors: [.quaternaryBackground, .quaternaryBackground]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let paywallChackmarkInactive = LinearGradient(
        gradient: Gradient(colors: [.tertiaryText, .tertiaryText]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

