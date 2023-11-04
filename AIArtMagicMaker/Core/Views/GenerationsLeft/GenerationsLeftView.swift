//
//  GenerationsLeftView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 07.07.2023.
//

import SwiftUI

struct GenerationsLeftView: View {

    // MARK: - Public Properties
    @Binding var isPresented: Bool
    let onTapGetPro: () -> Void
    let onTapWatchAd: () -> Void
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 24) {
            PrimaryButton(
                title: "Get PRO to Remove Limits",
                action: {
                    onTapGetPro()
                    isPresented = false
                }
            )
            
            TertiaryButton(
                title: "Watch ad to Generate",
                action: {
                    onTapWatchAd()
                    isPresented = false
                }
            )
        }
        .padding(.top)
        .popupOverlay(
            isPresented: $isPresented,
            title: "5/5 Generatons left",
            relativeHeight: 300 / 896,
            isVerticallyCentered: false
        )
    }
}

struct GenerationsLeftView_Previews: PreviewProvider {
    
    static var previews: some View {
        GenerationsLeftView(
            isPresented: .constant(true),
            onTapGetPro: {},
            onTapWatchAd: {}
        )
        .preferredColorScheme(.dark)
    }
}
