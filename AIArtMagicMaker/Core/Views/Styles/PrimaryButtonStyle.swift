//
//  PrimaryButtonStyle.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 17.06.2023.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    
    // MARK: - Public Properties
    let height: CGFloat

    // MARK: - Private Properties
    @Environment(\.isEnabled) private var isEnabled

    // MARK: - Body
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 22, weight: .semibold))
            .foregroundColor(.primaryText.opacity(isEnabled ? 1 : 0.2))
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                Group {
                    if isEnabled {
                        LinearGradient.primaryGradient
                    } else {
                        Color.secondaryBackground
                    }
                }
            )
            .clipShape(Capsule())
            .opacity(configuration.isPressed ? 0.7 : 1)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.spring(), value: [configuration.isPressed, isEnabled])
            .frame(height: height)
    }
}
