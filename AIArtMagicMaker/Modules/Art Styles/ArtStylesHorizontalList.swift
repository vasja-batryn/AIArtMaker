//
//  ArtStylesHorizontalList.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 10.07.2023.
//

import SwiftUI

struct ArtStylesHorizontalList: View {

    // MARK: - Public Properties
    let styles: [ArtStyle]
    @Binding var selection: ArtStyle?
    let cardWidth: CGFloat
    let seeAllAction: () -> Void

    // MARK: - Body
    var body: some View {
        VStack(spacing: 14) {
            HStack(spacing: 12) {
                Text("Select Style")
                    .font(.system(size: 19, weight: .semibold))

                Circle()
                    .fill(LinearGradient.pageIndicatorActive)
                    .frame(width: 8, height: 8)

                Text("Optional")
                    .font(.system(size: 14, weight: .regular))

                Spacer()

                Button(action: seeAllAction) {
                    HStack(spacing: 5) {
                        Text("See All")
                            .font(.system(size: 15, weight: .medium))
                        Image.chevronRight
                            .resizableToFit(width: 32, height: 32)
                    }
                }
            }
            .padding(.leading)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(styles) { style in
                        ArtStyleCardView(
                            style: style,
                            isSelected: selection == style,
                            onTap: {
                                selection = selection == style ? nil : style
                            }
                        )
                        .frame(width: cardWidth, height: cardWidth)
                    }
                }
                .padding(.horizontal)
            }
        }
        .foregroundColor(.primaryText)
    }
}

struct ArtStylesHorizontalList_Previews: PreviewProvider {
    
    static var previews: some View {
        ArtStylesHorizontalList(
            styles: ArtStyle.allCases,
            selection: .constant(.enhance),
            cardWidth: 117,
            seeAllAction: {}
        )
        .preferredColorScheme(.dark)
        .previewDisplayName("Selected style")

        ArtStylesHorizontalList(
            styles: ArtStyle.allCases,
            selection: .constant(nil),
            cardWidth: 117,
            seeAllAction: {}
        )
        .preferredColorScheme(.dark)
        .previewDisplayName("No style selected")
    }
}
