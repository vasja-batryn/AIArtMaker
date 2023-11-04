//
//  PrimaryButton.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 17.06.2023.
//

import SwiftUI

struct PrimaryButton: View {
    
    // MARK: - Public Properties
    let title: String
    var height: CGFloat = 60
    let action: () -> Void

    // MARK: - Body
    var body: some View {
        Button(title, action: action)
            .buttonStyle(PrimaryButtonStyle(height: height))
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            PrimaryButton(
                title: "Continue",
                action: {}
            )
            .previewDisplayName("Enabled")

            PrimaryButton(
                title: "Continue",
                action: {}
            )
            .disabled(true)
            .previewDisplayName("Disabled")

        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
