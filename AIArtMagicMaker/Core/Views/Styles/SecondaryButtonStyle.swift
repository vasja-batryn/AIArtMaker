//
//  SecondaryButtonStyle.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 27.06.2023.
//

import SwiftUI

struct SecondaryButtonStyle: ButtonStyle {
    
    // MARK: - Public Properties
    @Environment(\.isEnabled) var isEnabled
    let height: CGFloat
    let backgroundColor: Color?

    // MARK: - Body
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.primaryText.opacity(isEnabled ? 1 : 0.2))
            .font(.system(size: 15, weight: .medium))
            .padding(.horizontal)
            .padding(.vertical, 7)
            .background(
                Group {
                    if let backgroundColor = backgroundColor, isEnabled {
                        backgroundColor
                    } else if isEnabled {
                        LinearGradient.primaryGradient
                    } else {
                        Color.tertiaryBackground
                    }
                }
            )
            .clipShape(Capsule())
            .opacity(configuration.isPressed ? 0.7 : 1)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.spring(), value: configuration.isPressed)
            .frame(height: height)
    }
}
