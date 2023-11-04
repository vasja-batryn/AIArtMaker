//
//  TestArtFromText.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 19.07.2023.
//

import Foundation

enum TestArtFromText: Int {

    // MARK: - Cases
    case ring = 1
    case woman
    case dog
    case lighthouse
    case anime
    case cyberpank
    
    // MARK: - Public Properties
    var image: String {
        "TestImage-\(rawValue)"
    }
}

// MARK: - CaseIterable
extension TestArtFromText: CaseIterable{

}

// MARK: - Identifiable
extension TestArtFromText: Identifiable {
    var id: Int { rawValue }
}
