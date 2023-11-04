//
//  TertiaryButtonStyle.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 07.07.2023.
//

import SwiftUI

struct TertiaryButtonStyle: ButtonStyle {

    // MARK: - Public Properties
    let height: CGFloat
    let isDashStroke: Bool
    let isRounded: Bool
    let backgroundColor: Color?

    // MARK: - Private Properties
    private let buttonRadius: CGFloat = 16
    private var strokeStyle: StrokeStyle {
        isDashStroke ? StrokeStyle(lineWidth: 1, dash: [8]) : StrokeStyle(lineWidth: 1)
    }

    // MARK: - Body
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: isDashStroke ? 19 : 22, weight: .semibold))
            .foregroundColor(.primaryText)
            .frame(maxWidth: .infinity)
            .padding()
            .background {
                if isRounded {
                    Capsule()
                        .stroke(LinearGradient.pageIndicatorActive, style: strokeStyle)

                } else {
                    RoundedRectangle(cornerRadius: buttonRadius)
                        .fill(backgroundColor!)
                        .overlay {
                            RoundedRectangle(cornerRadius: buttonRadius)
                                .stroke(LinearGradient.pageIndicatorActive, style: strokeStyle)
                        }
                }
            }
            .opacity(configuration.isPressed ? 0.7 : 1)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.spring(), value: configuration.isPressed)
            .frame(height: height)
    }
}
