//
//  HudViewModifier.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 12.07.2023.
//

import SwiftUI

struct HudViewModifier: ViewModifier {

    // MARK: - Public Properties
    @Binding var type: HudType?

    // MARK: - Body
    func body(content: Content) -> some View {
        ZStack {
            content
                .disabled(type != nil)

            if let type = type {
                Color.popupBackground
                    .edgesIgnoringSafeArea(.all)
                    .transition(.opacity)

                HudView(type: type)
                    .zIndex(1)
                    .transition(.scale.combined(with: .opacity))
                    .onAppear {
                        if case .loader = type {

                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    self.type = nil
                                }
                            }
                        }
                    }
            }
        }
        .animation(.easeInOut(duration: 0.5), value: type)
    }
}

// MARK: - View+HudViewModifier
extension View {

    func hudView(type: Binding<HudType?>) -> some View {
        modifier(HudViewModifier(type: type))
    }
}

