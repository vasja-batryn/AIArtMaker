//
//  PromptExamplesListView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 10.07.2023.
//

import SwiftUI

struct PromptExamplesListView: View {
    
    // MARK: - Public Properties
    let examples: [PromptExample]
    @Binding var selection: PromptExample?
    
    // MARK: - Private Properties
    private let spacing: CGFloat = 12
    private var columns: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: spacing), count: 2)
    }
    
    @State private var selectedPromptExample: PromptExample?
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Examples")
                .font(.system(size: 28, weight: .semibold))
            
            LazyVGrid(columns: columns, spacing: spacing) {
                ForEach(examples) { example in
                    PromptExampleCardView(
                        example: example,
                        onTap: {
                            selectedPromptExample = example
                        }
                    )
                    .fullScreenCover(item: $selectedPromptExample) {
                        let viewModel = PromptExamplesViewModel(selectedExample: $0) { example in
                            selection = example
                            selectedPromptExample = nil
                        }
                        PromptExamplesView(viewModel: viewModel)
                    }
                }
            }
        }
        .foregroundColor(.primaryText)
    }
}

struct PromptExamplesListView_Previews: PreviewProvider {
    
    static var previews: some View {
        PromptExamplesListView(
            examples: PromptExample.allExamples,
            selection: .constant(nil)
        )
        .preferredColorScheme(.dark)
    }
}
