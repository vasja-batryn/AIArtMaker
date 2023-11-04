//
//  PaywallPlan.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 27.06.2023.
//

import Foundation

struct PaywallPlan: Equatable, Identifiable {
    
    // MARK: - Public Properties
    let id: String
    let price: String?
    let period: String?
    let pricePerWeek: String?
    let priceValue: Double

    var isYearly: Bool {
        id.lowercased().contains("year") ||
        id.lowercased().contains("annual") ||
        (period?.lowercased().contains("year") == true)
    }
    
    var isWeekly: Bool {
        id.lowercased().contains("week") ||
        period?.lowercased().contains("week") == true
    }
}
