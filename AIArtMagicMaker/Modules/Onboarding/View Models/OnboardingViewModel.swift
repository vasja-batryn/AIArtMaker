//
//  OnboardingViewModel.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 17.06.2023.
//

import Foundation
import UIKit

@MainActor
final class OnboardingViewModel: ObservableObject {

    // MARK: - Public Properties
    let pages = OnboardingPage.allCases

    var numberOfPages: Int {
        pages.count
    }

    var isFirstPage: Bool {
        currentPageIndex == 0
    }

    var isLastPage: Bool {
        currentPageIndex == numberOfPages - 1
    }

    @Published var currentPageIndex = 0
    @Published var hudType: HudType?
    @Published var accessAlertType: AccessAlertType?

    // MARK: - Private Properties
    private let paywallService: PaywallService

    // MARK: - Initializers
    init(paywallService: PaywallService) {
        self.paywallService = paywallService
    }

    // MARK: - Public Methods
    func didTapCloseButton() {
        UserDefaults.standard.set(
            value: false,
            forKey: .showOnboarding
        )
    }

    func didTapBackButton() {
        guard currentPageIndex > 0 else { return }
        currentPageIndex -= 1
    }

    func didTapPrimaryButton() {
        guard currentPageIndex + 1 < numberOfPages else {
            buySubscription()
            return
        }

        currentPageIndex += 1
    }

    func description(for page: OnboardingPage) -> String {
        guard
            page == .unlockFeatures,
            let defaultPlan = paywallService.defaultPlan,
            let price = defaultPlan.price,
            let period = defaultPlan.period
        else { return page.description }

        return String(format: page.description, price, period)
    }

    func restorePurchases() {
        Task {
            showLoading("Restoring Purchases…")
            do {
                try await paywallService.restorePurchases()
                showSuccessMessage("Restored")
                didTapCloseButton()
            } catch {
                showErrorMessage("Restoring Failed")
            }
        }
    }

    // MARK: - Private Methods
    private func buySubscription() {
        Task {
            guard let defaultPlan = paywallService.defaultPlan else {
                showErrorMessage("Purchasing Failed")
                return
            }

            showLoading("Purchasing Product…")
            do {
                hudType = .success(title: "Purchased")
                try await paywallService.purchasePlan(defaultPlan)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.didTapCloseButton()
                }
            } catch {
                showErrorMessage("Purchasing Failed")
            }
        }
    }


    private func showLoading(_ title: String) {
        hudType = .loader(title: title)
    }

    private func hideHud() {
        hudType = nil
    }

    private func showSuccessMessage( _ title: String) {
        hudType = .success(title: title)
    }

    private func showErrorMessage(_ title: String) {
        hudType = .error(title: title)
    }
}

extension OnboardingViewModel: HudPresenter {}
