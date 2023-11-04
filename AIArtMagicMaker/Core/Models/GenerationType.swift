//
//  GenerationType.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 19.07.2023.
//

import Foundation

enum GenerationType: String {
    
    // MARK: - Cases
    case fromText = "Art from text"
    case fromImage = "Art from image"
}

// MARK: - CaseIterable
extension GenerationType: CaseIterable {
    
}

// MARK: - Identifiable
extension GenerationType: Identifiable {
    var id: String { rawValue }
}
