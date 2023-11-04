//
//  HudView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 12.07.2023.
//

import SwiftUI

struct HudView: View {

    // MARK: - Public Properties
    let type: HudType
    let cornerRadius: CGFloat = 40
    let paddingIn: CGFloat = 32
    let paddingOut: CGFloat = 46

    // MARK: - Body
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                LottieView(
                    name: type.animationName,
                    isLooping: type.isLooping
                )

                Text(type.title)
                    .font(.system(size: 28, weight: .semibold))
                    .foregroundColor(.primaryText)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            .padding(paddingIn)
            .background {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.secondaryBackground)
            }
            .aspectRatio(1 / 1, contentMode: .fit)
            .padding(.horizontal, paddingOut)
        }
    }
}

struct HudView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            HudView(type: .loader())
                .previewDisplayName("Loader")
            HudView(type: .success())
                .previewDisplayName("Success")
            HudView(type: .error())
                .previewDisplayName("Error")
        }
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
    }
}
