//
//  GenerationsLeft.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 20.07.2023.
//

import SwiftUI

fileprivate struct GenerationsLeft: ViewModifier {

    // MARK: - Public Properties
    @Binding var isPresented: Bool
    let onTapGetPro: () -> Void
    let onTapWatchAd: () -> Void

    // MARK: - Body
    func body(content: Content) -> some View {
        content
            .popup(isPresented: $isPresented) {
                GenerationsLeftView(
                    isPresented: $isPresented,
                    onTapGetPro: onTapGetPro,
                    onTapWatchAd: onTapWatchAd
                )
            }
    }
}

// MARK: - View+GenerationsLeft
extension View {

    func generationsLeft(
        isPresented: Binding<Bool>,
        onTapGetPro: @escaping () -> Void,
        onTapWatchAd: @escaping () -> Void
    ) -> some View {
        modifier(
            GenerationsLeft(
                isPresented: isPresented,
                onTapGetPro: onTapGetPro,
                onTapWatchAd: onTapWatchAd
            )
        )
    }
}
