//
//  AppFeaturesList.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 27.06.2023.
//

import SwiftUI

struct AppFeaturesList: View {
    
    // MARK: - Private Properties
    private let items = AppFeature.allCases
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Unlock Premium Features")
                .font(.system(size: 22, weight: .semibold))
                .foregroundColor(.primaryText)

            VStack(alignment: .leading, spacing: 16.0) {
                ForEach(items) { item in
                    AppFeatureView(item: item)
                }
            }
        }
    }
}

struct AppFeaturesList_Previews: PreviewProvider {
    
    static var previews: some View {
        AppFeaturesList()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
