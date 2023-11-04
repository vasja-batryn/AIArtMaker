//
//  SecondaryButton.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 27.06.2023.
//

import SwiftUI

struct SecondaryButton: View {

    // MARK: - Public Properties
    let title: String
    var icon: Image? = nil
    var height: CGFloat = 36
    var backgroundColor: Color? = nil
    let action: () -> Void

    // MARK: - Body
    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                icon?
                    .resizableToFit(width: 16, height: 16)

                Text(title)
            }
        }
        .buttonStyle(
            SecondaryButtonStyle(
                height: height,
                backgroundColor: backgroundColor
            )
        )
    }
}

struct SecondaryButton_Previews: PreviewProvider {

    static var previews: some View {
        SecondaryButton(
            title: "Try PRO Now",
            icon: .starWithEffect,
            action: {}
        )

        SecondaryButton(
            title: "Inspire me",
            backgroundColor: Color.secondaryBackground,
            action: {}
        )
        .previewDisplayName("Secondary Button for TextField")
    }
}
