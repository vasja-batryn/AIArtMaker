//
//  HudType.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 11.07.2023.
//

enum HudType {

    // MARK: - Cases
    case loader(title: String = "Please, wait")
    case error(title: String = "Error")
    case success(title: String = "Success")

    // MARK: - Public Properties
    var title: String {
        switch self {
        case let .loader(title):
            return title
        case let .error(title):
            return title
        case let .success(title):
            return title
        }
    }

    var isLooping: Bool {
        if case .loader = self {
            return true
        } else {
            return false
        }
    }

    var animationName: String {
        switch self {
        case .loader:
            return "Loader"
        case .error:
            return "Error"
        case .success:
            return "Success"
        }
    }
}

// MARK: - Equatable
extension HudType: Equatable { }
