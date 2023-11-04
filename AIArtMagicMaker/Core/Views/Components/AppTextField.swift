//
//  AppTextField.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 11.07.2023.
//

import SwiftUI

struct AppTextField: View {

    // MARK: - Public Properties
    @Binding var text: String
    let title: String
    let placeholder: String
    let buttonText: String
    var isOptional: Bool = false
    let onTapButton: () -> Void

    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(spacing: 12) {
                Text(title)
                    .font(.system(size: 19, weight: .semibold))

                if isOptional {
                    Text("(Optional)")
                        .font(.system(size: 14, weight: .regular))
                }
            }

            VStack(spacing: 12) {
                TextField("", text: $text, axis: .vertical)
                    .placeholder(when: text.isEmpty) {
                        Text(placeholder)
                            .foregroundColor(.secondaryText)
                    }
                    .lineLimit(4, reservesSpace: true)
                    .font(.system(size: 16, weight: .regular))
                    .padding([.top, .horizontal], 16)

                HStack {
                    if !text.isEmpty {
                        Button(action: { text = "" }) {
                            Image.close
                                .resizableToFit(width: 35, height: 35)
                        }
                        .transition(.scale.combined(with: .opacity))
                    }

                    Spacer()

                    SecondaryButton(
                        title: buttonText,
                        backgroundColor: Color.secondaryBackground,
                        action: onTapButton
                    )
                    .disabled(!text.isEmpty)
                }
                .padding([.horizontal, .bottom], 12)
                .animation(.easeOut, value: text)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(isOptional ? LinearGradient.pageIndicatorInactive : LinearGradient.pageIndicatorActive, lineWidth: 1)
            )
        }
        .foregroundColor(.primaryText)
    }
}

struct AppTextField_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            AppTextField(
                text: .constant(""),
                title: "Enter Prompt",
                placeholder: "Add a detailed description of what you want to see in your artwork",
                buttonText: "Inspire me",
                onTapButton: {}
            )
            .previewDisplayName("No optional")

            AppTextField(
                text: .constant(""),
                title: "Enter Prompt",
                placeholder: "Add a detailed description of what you want to see in your artwork",
                buttonText: "Inspire me",
                isOptional: true,
                onTapButton: {}
            )
            .previewDisplayName("Optional")
        }
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
        .frame(width: 374, height: 182)
    }
}
