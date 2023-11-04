//
//  ImageSourcePickerView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 14.07.2023.
//

import SwiftUI

struct ImageSourcePickerView: View {
    
    // MARK: - Public Properties
    @Binding var isPresented: Bool
    let sources: [ImageSource]
    let onSelectSource: (ImageSource) -> Void

    // MARK: - Body
    var body: some View {
        HStack {
            Spacer()
            
            ForEach(sources) { source in
                CircleButton(
                    title: source.title,
                    icon: Image(source.imageName)
                ) {
                    onSelectSource(source)
                }
                
                Spacer()
            }
        }
        .popupOverlay(
            isPresented: $isPresented,
            title: "Add image from",
            relativeHeight: 242 / 896
        )
    }
}

struct ImageSourcePickerView_Previews: PreviewProvider {

    static var previews: some View {
        ImageSourcePickerView(
            isPresented: .constant(true),
            sources: ImageSource.allCases,
            onSelectSource: { _ in }
        )
        .preferredColorScheme(.dark)
    }
}
