//
//  LineProgressView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 12.07.2023.
//
import SwiftUI

struct LineProgressView: View {
    
    // MARK: - Public Properties
    @Binding var progress: Double

    // MARK: - Body
    var body: some View {
        ZStack(alignment: .leading) {
            Capsule()
                .foregroundColor(Color.secondaryBackground)

            GeometryReader { geometry in
                Capsule()
                    .frame(width: geometry.size.width * CGFloat(progress))
                    .foregroundColor(.clear)
                    .background(LinearGradient.pageIndicatorActive)
                    .cornerRadius(16)
            }
        }
    }
}

struct LineProgressView_Previews: PreviewProvider {

    static var previews: some View {
        LineProgressView(progress: .constant(0.40))
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .frame(height: 12)
            .padding()
    }
}
