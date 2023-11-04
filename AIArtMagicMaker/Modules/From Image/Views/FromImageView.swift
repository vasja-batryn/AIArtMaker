//
//  FromImageView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 28.06.2023.
//

import PhotosUI
import SwiftUI

struct FromImageView: View {

    // MARK: - Public Properties
    @StateObject var viewModel: FromImageViewModel

    // MARK: - Body
    var body: some View {
        BaseGenerationView(viewModel: viewModel) {
            titleView
        } content: { parentSize in
            Group {
                addChangeImageButton
                significanceView
                textField
            }
            .padding(.horizontal)

            ArtStylesHorizontalList(
                styles: viewModel.artStyles,
                selection: $viewModel.selectedArtStyle,
                cardWidth: parentSize.width * 0.277
            ) {
                viewModel.onTapSeeAllArtStyles()
            }

            generateButton
        }
        .photosPicker(
            isPresented: $viewModel.isPhotoLibraryPresented,
            selection: $viewModel.photosPickerItem
        )
    }
    
    private var titleView: some View {
        HStack {
            Text("Art from image")
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(.primaryText)

            Button {
                viewModel.onTapInstruction()
            } label: {
                Image.help
                    .resizableToFit(width: 23, height: 23)
            }
        }
    }
    
    private var addChangeImageButton: some View {
        TertiaryButton(
            title: viewModel.selectedImage != nil ? "Change image" : "Add image",
            icon: viewModel.selectedImage ?? .addPhoto,
            isDashStroke: true,
            isRounded: false,
            backgroundColor: .secondaryBackground
        ) {
            viewModel.onTapAddChangeImage()
        }
    }
    
    @ViewBuilder
    private var significanceView: some View {
        if viewModel.selectedImage != nil {
            ImageSignificanceView(progress: $viewModel.generationProgress)
        }
    }
    
    private var textField: some View {
        AppTextField(
            text: $viewModel.prompt,
            title: "Enter Prompt",
            placeholder: "Add a detailed description of what you want to see in your artwork",
            buttonText: "Inspire me",
            isOptional: true
        ) {
            viewModel.onTapInspireMe()
        }
    }
    
    private var generateButton: some View {
        PrimaryButton(title: "Generate") {
            viewModel.onTapGenerate()
        }
        .disabled(viewModel.selectedImage == nil)
        .padding(.horizontal)
    }
}

struct FromImageView_Previews: PreviewProvider {
    
    static var previews: some View {
        FromImageView(
            viewModel: .init(
                paywallService: ApphudPaywallService(apiKey: Constant.APIKey.apphud),
                artStyles: ArtStyle.allCases,
                onTapSeeAllArtStyles: {}
            )
        )
    }
}
