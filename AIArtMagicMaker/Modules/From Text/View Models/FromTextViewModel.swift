//
//  FromTextViewModel.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 28.06.2023.
//

import SwiftUI

final class FromTextViewModel: BaseGenerationViewModel {

    // MARK: - Public Properties
    @Published var selectedPromptExample: PromptExample?
    @Published var selectedAspectRatio: AspectRatio = .oneToOne

    let aspectRatios = AspectRatio.allCases

    @Published private(set) var isGenerationsLeftPresented = false

    // MARK: - Public Methods
    func onTapGenerate() {
        if paywallService.hasPremiumAccess {
            isLoadingPresented.toggle()
        } else {
            isGenerationsLeftPresented.toggle()
        }
    }

    func onTapInspireMe() {
        if let selectedArtStyle {
            selectedPromptExample = promptExamples
                .first(where: { $0.style == selectedArtStyle })
        } else if let randomExample = promptExamples.randomElement() {
            selectedPromptExample = randomExample
            selectedArtStyle = selectedPromptExample?.style
        }
        
        prompt = selectedPromptExample?.prompt ?? .empty
    }
}
