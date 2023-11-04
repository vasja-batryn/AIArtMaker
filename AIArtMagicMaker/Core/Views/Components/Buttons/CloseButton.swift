//
//  CloseButton.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 28.06.2023.
//

import SwiftUI

struct CloseButton: View {
    
    // MARK: - Public Properties
    let action: () -> Void

    // MARK: - Body
    var body: some View {
        Button(action: action) {
            Image.close
                .resizableToFit(width: 44, height: 44)
        }
        .foregroundColor(Color.primary)
    }
}

struct CloseButton_Previews: PreviewProvider {
    
    static var previews: some View {
        CloseButton(action: {})
    }
}
