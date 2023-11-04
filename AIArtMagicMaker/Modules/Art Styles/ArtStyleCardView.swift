//
//  ArtStyleCardView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 06.07.2023.
//

import SwiftUI

struct ArtStyleCardView: View {
    
    // MARK: - Public Properties
    let style: ArtStyle
    let isSelected: Bool
    let onTap: () -> Void
    
    // MARK: - Private Properties
    private let cornerRadius: CGFloat = 20
    
    // MARK: - Body
    var body: some View {
        Button(action: onTap) {
            ZStack(alignment: .bottom) {
                Image(style.image)
                    .resizable()
                    .scaledToFill()
                
                Text(style.description)
                    .font(.system(size: 14))
                    .foregroundColor(.primaryText)
                    .frame(maxWidth: .infinity)
                    .padding(5)
                    .background(
                        Rectangle()
                            .foregroundColor(.background.opacity(0.6))
                            .background(.ultraThinMaterial.opacity(0.8))
                    )
            }
            .cornerRadius(cornerRadius)
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(
                        LinearGradient.pageIndicatorActive,
                        lineWidth: 2
                    )
                    .opacity(isSelected ? 1 : 0)
            }
        }
        .animation(.interactiveSpring(), value: isSelected)
        .aspectRatio(1/1, contentMode: .fit)
        .padding(1)
    }
}

struct ArtStyleCardView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            ArtStyleCardView(
                style: .cinematic,
                isSelected: false,
                onTap: {}
            )
            .previewDisplayName("Unselected")
            
            ArtStyleCardView(
                style: .digitalArt,
                isSelected: true,
                onTap: {}
            )
            .previewDisplayName("Selected")
        }
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
        .frame(width: 117)
        .padding()
    }
}
