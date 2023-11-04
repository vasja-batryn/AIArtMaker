//
//  PromptExamplesViewModel.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 29.06.2023.
//

import Combine
import UIKit

final class PromptExamplesViewModel: ObservableObject {
    
    // MARK: - Public Properties
    var examples: [PromptExample]
    
    @Published var currentExample: PromptExample
    @Published var currentPageIndex = 0
    
    let completion: (PromptExample) -> Void
    
    // MARK: - Initialization
    init(selectedExample: PromptExample, completion: @escaping ((PromptExample) -> Void)) {
        examples = PromptExample.allExamples
        
        if let selectedIndex = examples.firstIndex(of: selectedExample) {
            examples.remove(at: selectedIndex)
            examples.insert(selectedExample, at: 0)
        }
        currentExample = selectedExample
        self.completion = completion
        configureBindings()
    }
    
    // MARK: - Public Methods
    func didTapPrimaryButton() {
        completion(currentExample)
    }
    
    func onCopyPrompt(from example: PromptExample) {
        UIPasteboard.general.string = example.prompt
    }
    
    // MARK: - Private Methods
    private func configureBindings() {
        $currentExample
            .combineLatest(Just(examples))
            .compactMap { $0.1.firstIndex(of: $0.0) }
            .assign(to: &$currentPageIndex)
    }
}
