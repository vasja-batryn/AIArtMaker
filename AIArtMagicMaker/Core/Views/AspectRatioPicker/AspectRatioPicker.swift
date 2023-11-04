//
//  AspectRatioPicker.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 06.07.2023.
//

import SwiftUI

struct AspectRatioPicker: View {
    
    // MARK: - Public Properties
    let ratios: [AspectRatio]
    @Binding var selection: AspectRatio

    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            Text("Select Aspect Ratio")
                .font(.system(size: 19, weight: .semibold))

            HStack(spacing: 12) {
                ForEach(ratios) { ratio in
                    AspectRatioView(
                        ratio: ratio,
                        isSelected: selection == ratio,
                        onTap: { selection = ratio }
                    )
                }
            }
            .animation(.easeInOut(duration: 2), value: selection)
        }
        .foregroundColor(.primaryText)
    }
}

struct AspectRatioPicker_Previews: PreviewProvider {
    
    static var previews: some View {
        AspectRatioPicker(
            ratios: AspectRatio.allCases,
            selection: .constant(.oneToOne)
        )
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
        .padding()
    }
}
