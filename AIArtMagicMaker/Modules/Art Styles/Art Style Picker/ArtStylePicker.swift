//
//  ArtStylePicker.swift
//  AIArtMagicMaker
//
//  Created by Yurii Marhitych on 20.07.2023.
//

import SwiftUI

fileprivate struct ArtStylePicker: ViewModifier {
    
    // MARK: - Public Properties
    @Binding var isPresented: Bool
    let styles: [ArtStyle]
    let selectedStyle: ArtStyle?
    let onSelectStyle: (ArtStyle) -> Void
    
    // MARK: - Body
    func body(content: Content) -> some View {
        content
            .popup(isPresented: $isPresented) {
                ArtStylePickerView(
                    isPresented: $isPresented,
                    styles: styles,
                    selectedStyle: selectedStyle,
                    onSelectStyle: onSelectStyle
                )
            }
    }
}

// MARK: - View+ArtStylePicker
extension View {
    
    func artStylePicker(
        isPresented: Binding<Bool>,
        styles: [ArtStyle],
        selectedStyle: ArtStyle?,
        onSelectStyle: @escaping (ArtStyle) -> Void
    ) -> some View {
        modifier(
            ArtStylePicker(
                isPresented: isPresented,
                styles: styles,
                selectedStyle: selectedStyle,
                onSelectStyle: onSelectStyle
            )
        )
    }
}
