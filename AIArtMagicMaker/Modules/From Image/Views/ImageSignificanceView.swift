//
//  ImageSignificanceView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 14.07.2023.
//

import SwiftUI

struct ImageSignificanceView: View {

    // MARK: - Public Properties
    @Binding var progress: CGFloat

    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Image significance")
                .font(.system(size: 19, weight: .semibold))

            HStack(alignment: .center, spacing: 12) {
                SliderView(progress: $progress)
                    .frame(height: 16)

                Text("\(Int(progress * 100))%")
                    .frame(width: 50)
            }
        }
        .foregroundColor(.primaryText)
    }
}

struct ImageSignificanceView_Previews: PreviewProvider {

    static var previews: some View {
        ImageSignificanceView(progress: .constant(0.4))
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
