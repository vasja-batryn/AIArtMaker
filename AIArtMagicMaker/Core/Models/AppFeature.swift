//
//  AppFeature.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 26.06.2023.
//

import Foundation

enum AppFeature: String, CaseIterable {
    
    // MARK: - Cases
    case unlimitedArtGeneration = "Unlimited Art Generation"
    case adFreeExperience = "Ad-free experience"
    case fasterProcessing = "Faster Processing"
    case removeWatermarks = "Remove Watermarks"
}

// MARK: - Identifiable
extension AppFeature: Identifiable {
    
    var id: String { rawValue }
}
