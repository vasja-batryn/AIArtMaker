//
//  PromptExamplesView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 29.06.2023.
//

import SwiftUI

struct PromptExamplesView: View {
    
    // MARK: - Private Properties
    @StateObject var viewModel: PromptExamplesViewModel
    @Environment(\.dismiss) private var dismiss

    // MARK: - Body
    var body: some View {
        VStack(spacing: 8) {
            TabView(selection: $viewModel.currentExample) {
                ForEach(viewModel.examples) { example in
                    PromptExampleView(example: example) {
                        viewModel.onCopyPrompt(from: example)
                    }
                    .tag(example)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.easeInOut, value: viewModel.currentExample)

            Spacer()

            PageIndicator(
                numberOfPages: viewModel.examples.count,
                currentPage: $viewModel.currentPageIndex
            )

            PrimaryButton(title: "Use this Prompt") {
                viewModel.didTapPrimaryButton()
            }
            .padding()
        }
        .background {
            Color.background
                .ignoresSafeArea()
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct PromptExamplesView_Previews: PreviewProvider {
    
    static var previews: some View {
        PromptExamplesView(viewModel: PromptExamplesViewModel(selectedExample: PromptExample(style: .anime, prompt: ""), completion: { _ in }))
    }
}
