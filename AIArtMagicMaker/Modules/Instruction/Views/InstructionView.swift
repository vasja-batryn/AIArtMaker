//
//  InstructionView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 03.07.2023.
//

import AVKit
import SwiftUI

struct InstructionView: View {
    
    // MARK: - Private Properties
    @StateObject private var viewModel = InstructionViewModel()
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 32) {
            HStack(alignment: .top) {
                Image.info
                    .resizableToFit(width: 20, height: 20)
                    
                Text("Higher Image significance percentage indicates a greater resemblance to the original image")
                    .font(.system(size: 14, weight: .regular))
            }
            .foregroundColor(.primaryText)
            .padding(.top)
            
            PlayerView(player: $viewModel.player)
        }
        .padding()
        .background {
            Color.background
                .ignoresSafeArea()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: dismiss.callAsFunction) {
                    Image.chevronLeft
                        .resizableToFit(width: 44, height: 44)
                }
            }
                
            ToolbarItem(placement: .principal) {
                Text("Video Tutorial")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.primaryText)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .onAppear(perform: viewModel.onAppear)
    }
}

struct InstructionView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            NavigationStack {
                InstructionView()
            }
            .previewDevice(PreviewDevice(stringLiteral: "iPhone 8"))
            .previewDisplayName("iPhone 8")
            
            NavigationStack {
                InstructionView()
            }
            .previewDisplayName("Current")
        }
    }
}
