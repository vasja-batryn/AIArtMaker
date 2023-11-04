//
//  OnboardingPageView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 17.06.2023.
//

import SwiftUI

struct OnboardingPageView: View {
    
    // MARK: - Public Properties
    let imageName: String
    let title: String
    let description: String
    
    // MARK: - Body
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()

            VStack(spacing: 16) {
                Text(title)
                    .font(.system(size: 28, weight: .semibold))
                    .foregroundColor(.primaryText)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)

                Text(description)
                    .font(.system(size: 20, weight: .regular))
                    .foregroundColor(.secondaryText)
                    .lineLimit(3)
                    .padding(.horizontal)
                    .minimumScaleFactor(0.5)
            }
            .padding()
        }
        .multilineTextAlignment(.center)
    }
}

struct OnboardingPageView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            OnboardingPageView(
                imageName: "Onboarding-2",
                title: "Enjoy a wide range of styles",
                description: "Choose your preferred art style and create unique masterpieces with different aspect ratios"
            )
            .previewDisplayName("Current")
            .preferredColorScheme(.dark)
        }
    }
}
