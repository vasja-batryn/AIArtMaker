//
//  AIArtMagicMakerApp.swift
//  AIArtMagicMaker
//
//  Created by Yurii Marhitych on 16.06.2023.
//

import SwiftUI

@main
struct AIArtMagicMakerApp: App {
    
    // MARK: - Public Properties
    let paywallService: PaywallService = ApphudPaywallService(apiKey: Constant.APIKey.apphud)
    
    // MARK: - Private Properties
    @AppStorage(UserDefaultsKey.showOnboarding.rawValue)
    private var showOnboarding = true
    
    // MARK: View Models
    @MainActor
    private var onboardingViewModel: OnboardingViewModel {
        OnboardingViewModel(paywallService: paywallService)
    }
    
    @MainActor
    private var mainTabViewModel: MainTabViewModel {
        MainTabViewModel(paywallService: paywallService)
    }
    
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            Group {
                if showOnboarding {
                    OnboardingView(viewModel: onboardingViewModel)
                } else {
                    MainTabView(viewModel: mainTabViewModel)
                }
            }
            .preferredColorScheme(.dark)
            .task {
                do {
                    try await paywallService.loadPlans()
                    print("Fetched \(paywallService.plans.count) paywall plans")
                } catch {
                    print("Loading paywall plans failed with error: \(error.localizedDescription).")
                }
            }
        }
    }
}

// MARK: - ServiceProvider
extension AIArtMagicMakerApp: ServiceProvider { }
