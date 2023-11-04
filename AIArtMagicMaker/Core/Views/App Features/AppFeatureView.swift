//
//  AppFeatureView.swift
//  AIArtMagicMaker
//
//  Created by Yurii Marhitych on 27.06.2023.
//

import SwiftUI

struct AppFeatureView: View {
    
    // MARK: - Public Properties
    let item: AppFeature
    
    // MARK: - Body
    var body: some View {
        HStack {
            Image.star
                .resizableToFit(width: 32, height: 32)
                .foregroundColor(.quaternaryGradient)
            
            Text(item.rawValue)
                .font(.system(size: 16, weight: .regular))
            
            Spacer()
        }
        .foregroundColor(.primaryText)
    }
}

struct AppFeatureView_Previews: PreviewProvider {
    
    static var previews: some View {
        AppFeatureView(item: .adFreeExperience)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
