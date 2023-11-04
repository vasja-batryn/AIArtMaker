//
//  Hud.swift
//  AIArtMagicMaker
//
//  Created by Yurii Marhitych on 20.07.2023.
//

import Foundation
import Combine

enum Hud {
    
    // MARK: - Public Static Methods
    static func showHud(ofType type: HudType?) {
        NotificationCenter.default.post(
            name: .showHud,
            object: type
        )
    }
    
    static func showAccessAlert(ofType type: AccessAlertType) {
        NotificationCenter.default.post(
            name: .showAccessDenied,
            object: type
        )
    }
}
