//
//  SettingsViewModel.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 21.06.2023.
//

import SwiftUI

final class SettingsViewModel: ObservableObject {
    
    // MARK: View Models
    var paywallViewModel: PaywallViewModel {
        PaywallViewModel(paywallService: paywallService)
    }
        
    // MARK: - Public Properties
    let settingsItems: [SettingsItem] = SettingsItem.allCases
    
    @Published var mailType: MailType?
    @Published var url: URL?
    @Published var showPaywall = false
    @Published var error: ErrorAlert?
    
    // MARK: - Private Properties
    private let paywallService: PaywallService
    
    // MARK: - Initializers
    init(paywallService: PaywallService) {
        self.paywallService = paywallService
    }
    
    // MARK: - Public Methods
    func onSelectItem(_ item: SettingsItem) {
        switch item {
        case .restore:
            restorePurchases()
        case .support:
            openMail(ofType: .support)
        case .rate:
            openRateApp()
        case .termsOfUse:
            url = Constant.AppURL.termsOfUse
        case .privacyPolicy:
            url = Constant.AppURL.privacyPolicy
        case .complaint:
            openMail(ofType: .complaint)
        }
    }
    
    func onTapTryProNow() {
        showPaywall = true
    }
    
    // MARK: - Private Methods
    private func restorePurchases() {
        Task {
            do {
                try await paywallService.restorePurchases()
            } catch {
                showError(message: error.localizedDescription)
            }
        }
    }
    
    private func openMail(ofType type: MailType) {
        if MailView.canSendMail {
            mailType = type
        } else {
            openURLIfPossible(type.emailToURL)
        }
    }
    
    private func openRateApp() {
        openURLIfPossible(Constant.AppURL.rateApp)
    }
    
    private func openURLIfPossible(_ url: URL?) {
        guard let url, UIApplication.shared.canOpenURL(url) else {
            showError(message: "Could not open the link")
            return
        }
        
        UIApplication.shared.open(url)
    }
    
    private func showError(message: String) {
        error = ErrorAlert(message: message)
    }
}
