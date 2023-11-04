//
//  PromptExampleView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 29.06.2023.
//

import SwiftUI

struct PromptExampleView: View {
    
    // MARK: - Public Properties
    let example: PromptExample
    let onTapCopy: () -> Void
    
    // MARK: - Private Properties
    @Environment(\.dismiss) private var dismiss
    @State private var isCloseVisible = false
    @State private var isCopiedMessageVisible = false
    
    // MARK: - Body
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Image(example.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: proxy.size.height * 0.36)
                    .overlay(alignment: .top) {
                        CloseButton(action: dismiss.callAsFunction)
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .opacity(isCloseVisible ? 1 : 0)
                            .animation(
                                .easeInOut(duration: isCloseVisible ? 1.5 : 0.3),
                                value: isCloseVisible
                            )
                    }
                    
                VStack(spacing: 16) {
                    HStack {
                        Text("Style:")
                            .font(.system(size: 19, weight: .semibold))
                        
                        Spacer()
                        
                        Text(example.style.description)
                            .font(.system(size: 18, weight: .regular))
                    }
                    .foregroundColor(.primaryText)
                    
                    Color.secondaryBackground
                        .frame(height: 1)
                    
                    HStack {
                        Text("Prompt:")
                            .font(.system(size: 19, weight: .semibold))
                            .foregroundColor(.primaryText)
                        
                        Spacer()
                        
                        Button(action: {
                            isCopiedMessageVisible = true
                            onTapCopy()
                        }) {
                            Image.copy
                                .resizable()
                                .scaledToFit()
                                .frame(width: 44, height: 44)
                        }
                    }
                    
                    Text(example.prompt)
                        .font(.system(size: 18, weight: .regular))
                        .foregroundColor(.secondaryText)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                }
                .minimumScaleFactor(0.8)
                .padding()
                .padding(.top, 90.0)
            }
            .background(
                Color.background
                    .ignoresSafeArea()
            )
            .toastMessage("Copied!", isPresented: $isCopiedMessageVisible)
        }
        .onAppear { isCloseVisible = true }
        .onDisappear {
            isCloseVisible = false
            isCopiedMessageVisible = false
        }
    }
}

struct PromptExampleView_Previews: PreviewProvider {
    
    static var previews: some View {
        PromptExampleView(example: .init(
            style: .isometric,
            prompt: "Stunning sunset over an ocean horizon, with orange and pink hues spreading across the sky, peaceful, serene, high detail, seascape"
        ), onTapCopy: {})
    }
}
