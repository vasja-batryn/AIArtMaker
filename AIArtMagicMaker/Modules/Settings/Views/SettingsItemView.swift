//
//  SettingsItemView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 21.06.2023.
//

import SwiftUI

struct SettingsItemView: View {
    
    // MARK: - Public Properties
    let item: SettingsItem

    // MARK: - Body
    var body: some View {
        HStack {
            Text(item.description)
            Spacer()
            Image.chevronRight
                .resizableToFit(width: 32, height: 32)
        }
        .font(.system(size: 18, weight: .regular))
        .foregroundColor(.primaryText)
    }
}

struct SettingsItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        SettingsItemView(item: .rate)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
