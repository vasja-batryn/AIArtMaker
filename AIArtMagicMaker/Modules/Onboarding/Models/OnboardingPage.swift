//
//  OnboardingPage.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 19.06.2023.
//

import SwiftUI

enum OnboardingPage: Int, CaseIterable {
    
    // MARK: - Cases
    case createArt = 1
    case chooseStyle
    case giveFeedback
    case unlockFeatures
    
    // MARK: - Public Properties
    var image: String {
        "Onboarding-\(rawValue)"
    }
    
    var title: String {
        switch self {
        case .createArt:
            return "Create your own art with AI"
        case .chooseStyle:
            return "Enjoy a wide range of styles"
        case .giveFeedback:
            return "We appreciate your feedback"
        case .unlockFeatures:
            return "Return to the artworks history"
        }
    }
    
    var description: String {
        switch self {
        case .createArt:
            return "Turn your ideas into AI-powered artworks in seconds from any text or image"
        case .chooseStyle:
            return "Choose your preferred art style and create unique masterpieces with different aspect ratios"
        case .giveFeedback:
            return "Love our app? Let us know what you think by rating and sharing your feedback"
        case .unlockFeatures:
            return "%@ per %@ & create unlimited AI-powered artworks without any watermarks or ads"
        }
    }
}

// MARK: - Identifiable
extension OnboardingPage: Identifiable {
    
    var id: Int { rawValue }
}
