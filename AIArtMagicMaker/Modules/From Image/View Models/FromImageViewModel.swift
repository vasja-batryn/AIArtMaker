//
//  FromImageViewModel.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 28.06.2023.
//

import PhotosUI
import SwiftUI

final class FromImageViewModel: BaseGenerationViewModel {

    // MARK: - Public Properties
    @Published var selectedPromptExample: PromptExample?
    @Published var selectedImage: Image?
    @Published var isPhotoLibraryPresented = false
    @Published var isCameraPresented = false

    @Published var photosPickerItem: PhotosPickerItem? {
        didSet {
            isImageSourcePickerPresented = false
            fetchImage()
        }
    }

    @Published private(set) var isImageSourcePickerPresented = false
    @Published private(set) var isInstructionPresented = false
    @Published private(set) var isGenerationsLeftPresented = false

    // MARK: - Public Methods
    func onSelectImageSource(_ source: ImageSource) {
        switch source {
        case .camera:
            isCameraPresented.toggle()
        case .gallery:
            isPhotoLibraryPresented.toggle()
        }
    }
    
    func onTapInstruction() {
        isInstructionPresented.toggle()
    }
    
    func onTapAddChangeImage() {
        isImageSourcePickerPresented.toggle()
    }

    func onTapGenerate() {
        if paywallService.hasPremiumAccess {
            isLoadingPresented.toggle()
        } else {
            isGenerationsLeftPresented.toggle()
        }
    }

    func onTapInspireMe() {
        var example: PromptExample?
        
        if let selectedArtStyle {
            example = promptExamples
                .first(where: { $0.style == selectedArtStyle })
        } else if let randomExample = promptExamples.randomElement() {
            example = randomExample
            selectedArtStyle = randomExample.style
        }
        
        prompt = example?.prompt ?? .empty
    }

    // MARK: - Private Methods
    private func fetchImage() {
        Task {
            let image = try? await photosPickerItem?.loadTransferable(type: Image.self)
            DispatchQueue.main.async {
                self.selectedImage = image
            }
        }
    }
}
