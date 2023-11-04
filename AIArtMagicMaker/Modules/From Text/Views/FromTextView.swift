//
//  FromTextView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 28.06.2023.
//

import SwiftUI

struct FromTextView: View {

    // MARK: - Public Properties
    @StateObject var viewModel: FromTextViewModel

    // MARK: - Body
    var body: some View {
        BaseGenerationView(viewModel: viewModel) {
            Text("Art from text")
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(.primaryText)
        } content: { parentSize in
            AppTextField(
                text: $viewModel.prompt,
                title: "Enter Prompt",
                placeholder: "Add a detailed description of what you want to see in your artwork",
                buttonText: "Inspire me",
                onTapButton: { viewModel.onTapInspireMe() }
            )
            .padding(.horizontal)

            ArtStylesHorizontalList(
                styles: viewModel.artStyles,
                selection: $viewModel.selectedArtStyle,
                cardWidth: parentSize.width * 0.277
            ) {
                viewModel.onTapSeeAllArtStyles()
            }

            Group {
                AspectRatioPicker(
                    ratios: viewModel.aspectRatios,
                    selection: $viewModel.selectedAspectRatio
                )

                PrimaryButton(
                    title: "Generate",
                    action: { viewModel.onTapGenerate() }
                )
                .disabled(viewModel.prompt.isEmpty)

                PromptExamplesListView(
                    examples: viewModel.promptExamples,
                    selection: $viewModel.selectedPromptExample
                )
            }
            .padding(.horizontal)
        }
    }
}

struct FromTextView_Previews: PreviewProvider {
    
    static var previews: some View {
        FromTextView(
            viewModel: .init(
                paywallService: ApphudPaywallService(apiKey: Constant.APIKey.apphud),
                artStyles: ArtStyle.allCases,
                onTapSeeAllArtStyles: {}
            )
        )
    }
}
