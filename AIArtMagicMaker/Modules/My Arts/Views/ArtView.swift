//
//  ArtView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 19.07.2023.
//

import SwiftUI

struct ArtView: View {

    // MARK: - Public Properties
    let image: String
    let onTap: () -> Void

    // MARK: - Private Properties
    private let cornerRadius: CGFloat = 16

    // MARK: - Body
    var body: some View {
        Button(action: onTap) {
            ZStack(alignment: .bottomTrailing) {
                Image(image)
                    .resizable()
                    .scaledToFill()

                Text("AI Art Magic Maker")
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundColor(.quaternaryGradient)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 12)
                    .background(
                        Capsule()
                            .fill(Color.primaryText)
                    )
                    .padding(8)
            }
            .cornerRadius(cornerRadius)
        }
        .aspectRatio(1 / 1, contentMode: .fit)
    }
}

struct ArtView_Previews: PreviewProvider {
    
    static var previews: some View {
        ArtView(
            image: "TestImage-2",
            onTap: {}
        )
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
        .frame(width: 180)
    }
}
