//
//  TestArtFromImage.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 19.07.2023.
//

import Foundation

enum TestArtFromImage: Int {

    // MARK: - Cases
    case dog

    // MARK: - Public Properties
    var image: String {
        "TestImageFromImage-\(rawValue)"
    }
}

// MARK: - CaseIterable
extension TestArtFromImage: CaseIterable{

}

// MARK: - Identifiable
extension TestArtFromImage: Identifiable {
    var id: Int { rawValue }
}
