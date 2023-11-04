//
//  ApphudPaywallService.swift
//  AIArtMagicMaker
//
//  Created by Yurii Marhitych on 04.07.2023.
//

import ApphudSDK

final class ApphudPaywallService: PaywallService {
    
    // MARK: - Public Properties
    var hasPremiumAccess: Bool {
        Apphud.hasPremiumAccess()
    }
    
    var plans: [PaywallPlan] {
        (paywall?.products ?? [])
            .map {
                PaywallPlan(
                    id: $0.productId,
                    price: $0.skProduct?.localizedPrice,
                    period: $0.skProduct?.localizedPeriod?.replacingOccurrences(of: "1 ", with: ""),
                    pricePerWeek: $0.skProduct?.localizedProfitPricePerWeek,
                    priceValue: $0.skProduct?.price.doubleValue ?? 0
                )
            }
    }
    
    var defaultPlan: PaywallPlan? {
        plans.first { $0.isWeekly }
    }
    
    // MARK: - Initialization
    init(apiKey: String) {
        Apphud.start(apiKey: apiKey)
    }
    
    // MARK: - Private Properties
    private var paywall: ApphudPaywall?
    
    // MARK: - Public Methods
    func loadPlans() async {
        let paywalls = await Apphud.paywalls()
        let abTestPaywall = paywalls.first(where: { $0.experimentName != nil })
        let defaultPaywall = paywalls.first(where: { $0.isDefault })
        
        if let abTestPaywall, !abTestPaywall.products.isEmpty {
            paywall = abTestPaywall
        } else {
            paywall = defaultPaywall
        }
    }
    
    func purchasePlan(_ plan: PaywallPlan) async throws {
        guard let product = paywall?.products.first(where: { $0.productId == plan.id }) else {
            throw PaywallServiceError.purchasePlanFailed
        }
        
        let result = await Apphud.purchase(product)
        
        if let error = result.error {
            throw error
        }
        
        guard result.success else {
            throw PaywallServiceError.purchasePlanFailed
        }
    }
    
    func restorePurchases() async throws {
        let error = await Apphud.restorePurchases()
        guard error != nil else { return }
        throw PaywallServiceError.restorePurchasesFailed
    }
}
