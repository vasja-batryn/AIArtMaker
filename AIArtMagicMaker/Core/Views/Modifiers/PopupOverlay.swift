//
//  PopupOverlay.swift
//  AIArtMagicMaker
//
//  Created by Yurii Marhitych on 17.07.2023.
//

import SwiftUI

struct PopupOverlay: ViewModifier {
    
    // MARK: - Public Properties
    @Binding var isPresented: Bool
    let title: String
    let relativeHeight: CGFloat
    let isVerticallyCentered: Bool
    
    // MARK: - Private Properties
    private let cornerRadius: CGFloat = 20
    private let spacing: CGFloat = 24
    private let padding: CGFloat = 20
    
    // MARK: - Body
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            VStack(spacing: spacing) {
                titleView
                
                // To align the content in the center of the popup.
                if isVerticallyCentered {
                    Spacer()
                }
                
                content
                    .padding(.horizontal, padding)
                
                Spacer()
            }
            .padding(.top, padding)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.secondaryBackground)
            .frame(
                height: geometry.size.height * relativeHeight +
                geometry.safeAreaInsets.bottom
            )
            .roundedCorner(cornerRadius, corners: [.topLeft, .topRight])
            .frame(maxHeight: .infinity, alignment: .bottom)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
    
    // MARK: - View Properties
    private var closeButton: some View {
        Button {
            isPresented = false
        } label: {
            Image.closeXmark
                .resizableToFit(width: 18, height: 18)
        }
    }
    
    private var titleView: some View {
        Text(title)
            .font(.system(size: 22, weight: .semibold))
            .lineLimit(1)
            .frame(maxWidth: .infinity)
            .overlay(alignment: .trailing) {
                closeButton
            }
            .padding(.horizontal, padding)
    }
}

// MARK: - View+PopupOverlay
extension View {
    
    func popupOverlay(
        isPresented: Binding<Bool>,
        title: String,
        relativeHeight: CGFloat,
        isVerticallyCentered: Bool = true
    ) -> some View {
        modifier(
            PopupOverlay(
                isPresented: isPresented,
                title: title,
                relativeHeight: relativeHeight,
                isVerticallyCentered: isVerticallyCentered
            )
        )
    }
}
