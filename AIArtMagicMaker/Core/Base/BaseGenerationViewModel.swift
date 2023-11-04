//
//  BaseGenerationViewModel.swift
//  AIArtMagicMaker
//
//  Created by Yurii Marhitych on 20.07.2023.
//

import Foundation

@MainActor
class BaseGenerationViewModel: ObservableObject {
    
    // MARK: - Public Properties
    let paywallService: PaywallService
    let artStyles: [ArtStyle]
    let onTapSeeAllArtStyles: () -> Void
    let promptExamples = PromptExample.allExamples
    
    @Published var prompt: String = .empty
    @Published var selectedArtStyle: ArtStyle?
    @Published var generationProgress: CGFloat = .zero
    @Published var isLoadingPresented = false
    
    // MARK: - Initialization
    init(
        paywallService: PaywallService,
        artStyles: [ArtStyle],
        onTapSeeAllArtStyles: @escaping () -> Void
    ) {
        self.paywallService = paywallService
        self.artStyles = artStyles
        self.onTapSeeAllArtStyles = onTapSeeAllArtStyles
    }
    
    // MARK: - Public Methods
    func onTapTryPro() {
        showPaywall()
    }
}

// MARK: - PaywallPresenter
extension BaseGenerationViewModel: PaywallPresenter { }
