//
//  CircleButton.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 14.07.2023.
//

import SwiftUI

struct CircleButton: View {

    // MARK: - Public Properties
    let title: String
    let icon: Image
    var isFilled = false
    let action: () -> Void

    // MARK: - Body
    var body: some View {
        Button(action: action) {
            VStack(spacing: 10) {
                icon
                    .resizableToFit(width: 32, height: 32)
                    .padding()
                    .background(
                        Group {
                            if isFilled {
                                Circle()
                                    .fill(LinearGradient.pageIndicatorActive)
                            } else {
                                Circle()
                                    .stroke(LinearGradient.primaryGradient, lineWidth: 1)
                            }
                        }
                    )

                Text(title)
                    .font(.system(size: 15, weight: .medium))
                    .lineLimit(1)
            }
        }
        .foregroundColor(.primaryText)
    }
}

struct CircleButton_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            CircleButton(
                title: "Regenerate",
                icon: Image.regenerate,
                action: {}
            )
            .previewDisplayName("Regenerate")

            CircleButton(
                title: "Share",
                icon: Image.share,
                isFilled: true,
                action: {}
            )
            .previewDisplayName("Share")

            CircleButton(
                title: "Save",
                icon: Image.save,
                action: {}
            )
            .previewDisplayName("Save")

            CircleButton(
                title: "Camera",
                icon: Image.camera,
                action: {}
            )
            .previewDisplayName("Camera")

            CircleButton(
                title: "Gallery",
                icon: Image.gallery,
                action: {}
            )
            .previewDisplayName("Gallery")
        }
        .preferredColorScheme(.dark)
    }
}
