//
//  ArtStyle.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 29.06.2023.
//

import Foundation

enum ArtStyle: String {
    
    // MARK: - Cases
    case enhance
    case model3D = "3d-model"
    case cinematic
    case isometric
    case digitalArt = "digital-art"
    case fantasyArt = "fantasy-art"
    case lowPoly = "low-poly"
    case anime
    case photographic
    case neonPunk = "neon-punk"
    case comicBook = "comic-book"
    case analogFilm = "analog-film"
    case origami
    case lineArt = "line-art"
    case craftClay = "craft-clay"
    case pixelArt = "pixel-art"
    
    var image: String {
        return "\(self.rawValue)-style"
    }
}

// MARK: - CustomStringConvertible
extension ArtStyle: CustomStringConvertible {
    
    var description: String {
        switch self {
        case .enhance:
            return "Enhance"
        case .model3D:
            return "3D Model"
        case .cinematic:
            return "Cinematic"
        case .isometric:
            return "Isometric"
        case .digitalArt:
            return "Digital Art"
        case .fantasyArt:
            return "Fantasy Art"
        case .lowPoly:
            return "Low Poly"
        case .anime:
            return "Anime"
        case .photographic:
            return "Photographic"
        case .neonPunk:
            return "Neon Punk"
        case .comicBook:
            return "Comic Book"
        case .analogFilm:
            return "Analog Film"
        case .origami:
            return "Origami"
        case .lineArt:
            return "Line Art"
        case .craftClay:
            return "Craft Clay"
        case .pixelArt:
            return "Pixel Art"
        }
    }
}

// MARK: - CaseIterable
extension ArtStyle: CaseIterable{

}

// MARK: - Identifiable
extension ArtStyle: Identifiable {
    var id: String { rawValue }
}
