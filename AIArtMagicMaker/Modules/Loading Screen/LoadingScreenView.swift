//
//  LoadingScreenView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 12.07.2023.
//

import SwiftUI

struct LoadingScreenView: View {
    
    // MARK: - Public Properties
    @Binding var progress: Double
    let title: String

    // MARK: - Body
    var body: some View {
        VStack(spacing: 24) {
            LottieView(
                name: "Loading",
                isLooping: true
            )

            Text(title)
                .font(.system(size: 20, weight: .regular))
                .foregroundColor(.primaryText)
                .multilineTextAlignment(.center)

            LineProgressView(progress: $progress)
                .frame(height: 12)
        }
        .padding(.horizontal)
        .padding(.bottom, 35.0)
        .background(
            Color.background
                .ignoresSafeArea()
        )
    }
}

struct LoadingScreenView_Previews: PreviewProvider {

    static var previews: some View {
        LoadingScreenView(
            progress: .constant(0.55),
            title: "We will automatically save \nthis art to «My Arts»"
        )
        .preferredColorScheme(.dark)
    }
}
