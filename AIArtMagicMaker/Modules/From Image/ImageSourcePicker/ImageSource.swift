//
//  ImageSource.swift
//  AIArtMagicMaker
//
//  Created by Yurii Marhitych on 20.07.2023.
//

enum ImageSource: String {
    
    // MARK: - Cases
    case camera
    case gallery
    
    // MARK: - Public Properties
    var title: String {
        rawValue.capitalized
    }
    
    var imageName: String {
        rawValue.capitalized
    }
}

// MARK: - CaseIterable
extension ImageSource: CaseIterable { }

// MARK: - Identifiable
extension ImageSource: Identifiable {
    
    var id: Int { hashValue }
}
