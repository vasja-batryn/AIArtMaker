//
//  ToastMessageView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 03.07.2023.
//

import SwiftUI

struct ToastMessageView: View {
    
    // MARK: - Public Properties
    let message: String
    
    // MARK: - Body
    var body: some View {
        Text(message)
            .font(.system(size: 16, weight: .regular))
            .foregroundColor(.invertedText)
            .padding(.horizontal, 24)
            .frame(height: 44)
            .background(Color.primaryText)
            .clipShape(Capsule())
            .transition(
                .asymmetric(
                    insertion: .push(from: .top),
                    removal: .push(from: .bottom)
                )
                .combined(with: .opacity)
            )
    }
}

struct ToastMessageView_Previews: PreviewProvider {
    
    static var previews: some View {
        ToastMessageView(message: "Copied!")
            .preferredColorScheme(.dark)
    }
}
