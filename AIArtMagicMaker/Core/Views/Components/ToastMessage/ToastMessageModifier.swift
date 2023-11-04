//
//  File.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 03.07.2023.
//
import SwiftUI

struct ToastMessageModifier: ViewModifier {
    
    // MARK: - Public Properties
    let message: String
    @Binding var isPresented: Bool

    // MARK: - Body
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .top) {
                if isPresented {
                    ToastMessageView(message: message)
                        .task { await scheduleReset() }
                }
            }
            .animation(.easeInOut, value: isPresented)
    }

    // MARK: - Private Methods
    private func scheduleReset() async {
        try? await Task.sleep(for: .seconds(1.5))
        isPresented = false
    }
}

// MARK: - View+ToastMessageModifier
extension View {
    
    @ViewBuilder
    func toastMessage(_ message: String, isPresented: Binding<Bool>) -> some View {
        modifier(ToastMessageModifier(message: message, isPresented: isPresented))
    }
}
