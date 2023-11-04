//
//  MyArtsViewModel.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 28.06.2023.
//

import SwiftUI

final class MyArtsViewModel: ObservableObject {

    // MARK: - Public Properties
    @Published var isEmptyState = false
    @Published var selectedPickerTab: GenerationType = .fromText
    @Published var isArtResultPresented = false

    let generationTypes = GenerationType.allCases
    let arts = TestArtFromText.allCases

    // MARK: - Private Properties
    private let onStartGenerating: (GenerationType) -> Void

    // MARK: - Initializers
    init(onStartGenerating: @escaping (GenerationType) -> Void) {
        self.onStartGenerating = onStartGenerating
    }

    // MARK: - Public Methods
    func onTapStartGenerating() {
        onStartGenerating(selectedPickerTab)
    }

    func onTapTryProNow() {
        showPaywall()
    }

    func onTapArt() {
        isArtResultPresented.toggle()
    }
}

// MARK: - PaywallPresenter
extension MyArtsViewModel: PaywallPresenter {}
