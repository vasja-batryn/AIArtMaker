//
//  AspectRatioView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 06.07.2023.
//

import SwiftUI

struct AspectRatioView: View {
    
    // MARK: - Public Properties
    let ratio: AspectRatio
    let isSelected: Bool
    let onTap: () -> Void
    
    // MARK: - Body
    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 7) {
                Rectangle()
                    .stroke(
                        Color.primaryText,
                        lineWidth: 1.5
                    )
                    .aspectRatio(ratio.value, contentMode: .fit)
                
                Text(ratio.rawValue)
                    .font(.system(size: 15, weight: .medium))
            }
            .padding(.horizontal, 20)
            .padding(.vertical, ratio == .threeToFour ? 8 : 11)
            .foregroundColor(.primaryText)
            .background(Color.secondaryBackground)
            .clipShape(Capsule())
            .overlay(
                Capsule()
                    .stroke(
                        LinearGradient.pageIndicatorActive,
                        lineWidth: 1
                    )
                    .opacity(isSelected ? 1 : 0)
            )
        }
        .frame(height: 38)
        .animation(.easeInOut, value: isSelected)
    }
}


struct AspectRatioView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            AspectRatioView(
                ratio: .fourToThree,
                isSelected: false,
                onTap: {}
            )
            .previewDisplayName("4:3")
            
            AspectRatioView(
                ratio: .oneToOne,
                isSelected: true,
                onTap: {}
            )
            .previewDisplayName("1:1 Selected")
            
            AspectRatioView(
                ratio: .threeToFour,
                isSelected: false,
                onTap: {}
            )
            .previewDisplayName("3:4")
        }
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
        .padding()
    }
}
