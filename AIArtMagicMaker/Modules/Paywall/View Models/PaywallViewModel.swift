//
//  PaywallViewModel.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 27.06.2023.
//

import Foundation

final class PaywallViewModel: ObservableObject {
    
    // MARK: - Private Properties
    private let paywallService: PaywallService
    
    // MARK: - Initializers
    init(paywallService: PaywallService) {
        self.paywallService = paywallService
    }
    
    // MARK: - Public Properties
    @Published var selectedPlan: PaywallPlan?
    @Published private(set) var isCloseVisible = false
    @Published var error: ErrorAlert?
    
    @Published var plans: [PaywallPlan] = []

    let footerText = "Your subscription will renew automatically every period and payment will be charged to your Tunes Account within 24 hours prior to the end of the current period. Subscription automatically renews unless auto-renew is turned off at least 24-hours before the end of the current period. Any unused portion of a free trial period will be forfeited when you purchase a subscription. You can turn off auto-renewal by going to your Account Settings after purchase. No cancellation of your subscription is allowed during the active subscription is allowed during the active subscription period."
    
    // MARK: - Public Methods
    func onAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.isCloseVisible = true
        }
        fetchData()
    }
    
    func selectPlan(_ plan: PaywallPlan) {
        selectedPlan = plan
    }

    func buyPremium() {
        Task {
            guard let selectedPlan = selectedPlan else { return }
            
            do {
                try await paywallService.purchasePlan(selectedPlan)

            } catch {
                showError(message: error.localizedDescription)
            }
        }
    }
    
    func restorePurchases() {
        Task {
            do {
                try await paywallService.restorePurchases()
            } catch {
                showError(message: error.localizedDescription)
            }
        }
    }
    // MARK: - Private Methods
    private func fetchData() {
        plans = paywallService.plans.sorted(by: { $0.priceValue > $1.priceValue })
        selectedPlan = plans.first(where: { $0.isYearly })
    }

    private func showError(message: String) {
        error = ErrorAlert(message: message)
    }
}
