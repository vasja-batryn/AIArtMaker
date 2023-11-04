//
//  ImageSourcePicker.swift
//  AIArtMagicMaker
//
//  Created by Yurii Marhitych on 20.07.2023.
//

import SwiftUI

fileprivate struct ImageSourcePicker: ViewModifier {
    
    // MARK: - Public Properties
    @Binding var isPresented: Bool
    let sources: [ImageSource]
    let onSelectSource: (ImageSource) -> Void
    
    // MARK: - Body
    func body(content: Content) -> some View {
        content
            .popup(isPresented: $isPresented) {
                ImageSourcePickerView(
                    isPresented: $isPresented,
                    sources: sources,
                    onSelectSource: onSelectSource
                )
            }
    }
}

// MARK: - View+ImageSourcePicker
extension View {
    
    func imageSourcePicker(
        isPresented: Binding<Bool>,
        sources: [ImageSource],
        onSelectSource: @escaping (ImageSource) -> Void
    ) -> some View {
        modifier(
            ImageSourcePicker(
                isPresented: isPresented,
                sources: sources,
                onSelectSource: onSelectSource
            )
        )
    }
}
