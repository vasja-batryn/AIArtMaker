//
//  PopupModifier.swift
//  AIArtMagicMaker
//
//  Created by Yurii Marhitych on 10.07.2023.
//

import SwiftUI

struct PopupModifier<PopupContent: View>: ViewModifier {

    // MARK: - Public Properties
    @Binding var isPresented: Bool
    let popupContent: () -> PopupContent
    
    // MARK: - Body
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if isPresented {
                Color.popupBackground
                    .ignoresSafeArea()
                    .transition(.opacity)
                    .onTapGesture {
                        isPresented = false
                    }
                
                popupContent()
                    .zIndex(1)
                    .transition(
                        .move(edge: .bottom)
                        .combined(with: .opacity)
                    )
            }
        }
        .animation(.easeOut, value: isPresented)
    }
}

// MARK: - View+PopupModifier
extension View {
    
    func popup<PopupContent: View>(
        isPresented: Binding<Bool>,
        content: @escaping () -> PopupContent
    ) -> some View {
        modifier(PopupModifier(isPresented: isPresented, popupContent: content))
    }
}
