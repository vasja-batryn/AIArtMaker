//
//  PageIndicator.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 17.06.2023.
//

import SwiftUI

struct PageIndicator: View {
    
    // MARK: - Public Properties
    let numberOfPages: Int
    @Binding var currentPage: Int

    // MARK: - Private Properties
    private let dotDiameter: CGFloat = 8
    
    private var activeIndicatorWidth: CGFloat {
        dotDiameter * 4 - dotDiameter / 2
    }
    
    private var indicatorOffset: CGFloat {
        CGFloat(currentPage) * dotDiameter * 2
    }
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: dotDiameter) {
            ForEach(0..<numberOfPages, id: \.self) { page in
                Capsule()
                    .fill(
                        currentPage == page ? LinearGradient.pageIndicatorActive : LinearGradient.pageIndicatorInactive
                    )
                    .frame(
                        width: currentPage == page ? activeIndicatorWidth : dotDiameter,
                        height: dotDiameter
                    )
            }
        }
        .overlay(
            Capsule()
                .fill(LinearGradient.pageIndicatorActive)
                .frame(width: activeIndicatorWidth, height: dotDiameter)
                .offset(x: indicatorOffset),
            alignment: .leading
        )
        .animation(.easeInOut, value: currentPage)
    }
}

struct PageIndicator_Previews: PreviewProvider {
    
    static var previews: some View {
        PageIndicator(numberOfPages: 4, currentPage: .constant(1))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
