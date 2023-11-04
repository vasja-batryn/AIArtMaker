//
//  SliderView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 14.07.2023.
//

import SwiftUI

struct SliderView: View {

    // MARK: - Public Properties
    @Binding var progress: CGFloat

    // MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                let verticalPadding = geometry.size.height / 4
                
                Capsule()
                    .foregroundColor(.secondaryBackground)
                    .padding(.vertical, verticalPadding)

                Capsule()
                    .fill(LinearGradient.pageIndicatorActive)
                    .frame(width: geometry.size.width * progress)
                    .padding(.vertical, verticalPadding)

                let circleWidth = geometry.size.height
                
                Circle()
                    .fill(Color.primaryText)
                    .frame(width: circleWidth, height: circleWidth)
                    .offset(x: geometry.size.width * progress - circleWidth / 2)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                progress = CGFloat(min(max(0, value.location.x / geometry.size.width), 1))
                            }
                    )
            }
        }
    }
}

struct SliderView_Previews: PreviewProvider {

    static var previews: some View {
        SliderView(progress: .constant(0.45))
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .frame(height: 16)
            .padding()
    }
}
