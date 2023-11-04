//
//  Examples.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 10.07.2023.
//

import Foundation

enum Examples: String {
    
    // MARK: - Cases
    case enhance
    case digitalArt = "digital-art"
    case cinematic
    case isometric
    case model3D = "3d-model"
    case fantasyArt = "fantasy-art"
    case lowPoly = "low-poly"
    case anime
    case photographic
    
    var image: String {
        return "\(self.rawValue)-example" 
    }
}

// MARK: - CaseIterable
extension Examples: CaseIterable{

}

// MARK: - Identifiable
extension Examples: Identifiable {
    var id: String { rawValue }
}
