//
//  PaywallServiceError.swift
//  AIArtMagicMaker
//
//  Created by Yurii Marhitych on 04.07.2023.
//

import Foundation

enum PaywallServiceError: LocalizedError {
    
    // MARK: - Cases
    case purchasePlanFailed
    case restorePurchasesFailed
    
    // MARK: - Public Properties
    var errorDescription: String? {
        switch self {
        case .purchasePlanFailed:
            return "Could not purchase plan"
        case .restorePurchasesFailed:
            return "Could not restore purchases"
        }
    }
}
