//
//  PromptExampleCardView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 10.07.2023.
//

import SwiftUI

struct PromptExampleCardView: View {
    
    // MARK: - Public Properties
    let example: PromptExample
    let onTap: () -> Void
    
    // MARK: - Private Properties
    private let cornerRadius: CGFloat = 16
    
    // MARK: - Body
    var body: some View {
        Button(action: onTap) {
            GeometryReader { geometry in
                ZStack(alignment: .bottom) {
                    Image(example.imageName)
                        .resizable()
                        .scaledToFill()
                    
                    Text("Try")
                        .font(.system(size: 19, weight: .semibold))
                        .frame(width: 0.48 * geometry.size.width, height: 0.26 * geometry.size.height)
                        .background(
                            LinearGradient.pageIndicatorActive
                        )
                        .cornerRadius(cornerRadius, corners: .topLeft)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .cornerRadius(cornerRadius)
            }
        }
        .aspectRatio(1/1, contentMode: .fit)
        .foregroundColor(.primaryText)
    }
}

struct PromptExampleCardView_Previews: PreviewProvider {
    
    static var previews: some View {
        PromptExampleCardView(
            example: .allExamples[3],
            onTap: {}
        )
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
        .frame(width: 180)
    }
}
