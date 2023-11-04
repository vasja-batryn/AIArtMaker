//
//  ArtResultViewModel.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 18.07.2023.
//

import Foundation
import SwiftUI

final class ArtResultViewModel: ObservableObject {

    // MARK: - Public Properties
    @Published var selectedArtStyle: ArtStyle? = .digitalArt
    @Published var isWatermarkEnabled: Bool
    @Published var isFromTextToPicture = true
    @Published var isGenerationsLeftPresented = false
    @Published var isSelectArtStylePresented = false
    @Published var sharedImage: Image = .star
    @Published var promptText: String = "sailor moon, artgerm, on the moon, in the style of cyberpunk futurism, light violet and gold, lilia alvarado, shang dynasty, andrzej sykut, bold, vibrant colors, close up, vray"

    let artStyles = ArtStyle.allCases

    // MARK: - Private Properties
    private let paywallService: PaywallService

    // MARK: - Initializers
    init(paywallService: PaywallService) {
        self.paywallService = paywallService
        self.isWatermarkEnabled = !paywallService.hasPremiumAccess
    }

    // MARK: - Public Methods
    func onTapRegenerate() {
        if paywallService.hasPremiumAccess {
            // TODO: - Add functionality
        } else {
            isGenerationsLeftPresented = true
        }
    }

    func onSelectStyle(_ style: ArtStyle) {
        selectedArtStyle = style
    }

    func onTapSave() {

    }

    func onTapTryProNow() {
        showPaywall()
    }

    func onTapSeelAllStyles() {
        isSelectArtStylePresented = true
    }

    func onTapWatchAd() {
        // TODO: - Add functionality
    }

    func watermarkStateDidChange(newValue: Bool) {
        if !paywallService.hasPremiumAccess && !newValue {
            showPaywall()
            isWatermarkEnabled = true
        } else {
            isWatermarkEnabled = newValue
        }
    }
}

// MARK: - PaywallPresenter
extension ArtResultViewModel: PaywallPresenter {}
