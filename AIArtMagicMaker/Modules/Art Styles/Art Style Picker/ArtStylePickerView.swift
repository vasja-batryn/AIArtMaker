//
//  ArtStylePickerView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 06.07.2023.
//

import SwiftUI

struct ArtStylePickerView: View {

    // MARK: - Private Properties
    private let styles: [ArtStyle]
    private let onSelectStyle: (ArtStyle) -> Void
    private let spacing: CGFloat = 12
    private var columns: [GridItem] {
        Array(repeating: GridItem(spacing: spacing), count: 3)
    }
    
    @Binding private var isPresented: Bool
    @State private var selectedStyle: ArtStyle?

    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: spacing) {
                ForEach(styles) { style in
                    ArtStyleCardView(
                        style: style,
                        isSelected: selectedStyle == style,
                        onTap: {
                            Task {
                                selectedStyle = style
                                try? await Task.sleep(nanoseconds: 300_000_000)
                                onSelectStyle(style)
                                isPresented.toggle()
                            }
                        }
                    )
                }
            }
        }
        .popupOverlay(
            isPresented: $isPresented,
            title: "Select Style",
            relativeHeight: 760 / 896,
            isVerticallyCentered: false
        )
    }
    
    // MARK: - Initialization
    init(
        isPresented: Binding<Bool>,
        styles: [ArtStyle],
        selectedStyle: ArtStyle? = nil,
        onSelectStyle: @escaping (ArtStyle) -> Void
    ) {
        self._isPresented = isPresented
        self.styles = styles
        self.selectedStyle = selectedStyle
        self.onSelectStyle = onSelectStyle
    }
}

struct ArtStylePickerView_Previews: PreviewProvider {

    static var previews: some View {
        ArtStylePickerView(
            isPresented: .constant(true),
            styles: ArtStyle.allCases,
            selectedStyle: .anime,
            onSelectStyle: { _ in }
        )
        .preferredColorScheme(.dark)
    }
}
