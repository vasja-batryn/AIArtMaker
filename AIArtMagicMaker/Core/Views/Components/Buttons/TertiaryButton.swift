//
//  TertiaryButton.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 07.07.2023.
//

import SwiftUI

struct TertiaryButton: View {

    // MARK: - Public Properties
    let title: String
    var icon: Image?
    var height: CGFloat = 60
    var isDashStroke: Bool = false
    var isRounded: Bool = true
    var backgroundColor: Color?
    let action: () -> Void

    // MARK: - Body
    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Text(title)

                icon?
                    .resizableToFit(width: 25, height: 25)
            }
        }
        .buttonStyle(
            TertiaryButtonStyle(
                height: height,
                isDashStroke: isDashStroke,
                isRounded: isRounded,
                backgroundColor: backgroundColor
            )
        )
    }
}

struct TertiaryButton_Previews: PreviewProvider {

    static var previews: some View {
        Group {
            TertiaryButton(
                title: "Add image",
                icon: Image.addPhoto,
                isDashStroke: true,
                isRounded: false,
                backgroundColor: Color.secondaryBackground,
                action: {}
            )
            .previewDisplayName("Add image")

            TertiaryButton(
                title: "Watch ad to Generate",
                action: {}
            )
            .previewDisplayName("Watch ad to Generate")
        }
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
