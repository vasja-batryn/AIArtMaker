//
//  PaywallService.swift
//  AIArtMagicMaker
//
//  Created by Yurii Marhitych on 04.07.2023.
//

import Foundation

protocol PaywallService {

    // MARK: - Property Requirements
    var hasPremiumAccess: Bool { get }
    
    var plans: [PaywallPlan] { get }
    
    var defaultPlan: PaywallPlan? { get }
    
    // MARK: - Method Requirements
    func loadPlans() async throws
    func purchasePlan(_ plan: PaywallPlan) async throws
    func restorePurchases() async throws
}
