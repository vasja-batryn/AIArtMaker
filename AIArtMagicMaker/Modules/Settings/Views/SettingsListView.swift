//
//  SettingsListView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 21.06.2023.
//

import SwiftUI

struct SettingsListView: View {
    
    // MARK: - Public Properties
    @ObservedObject var viewModel: SettingsViewModel

    // MARK: - Body
    var body: some View {
        VStack {
            ForEach(viewModel.settingsItems) { item in
                Button {
                    viewModel.onSelectItem(item)
                } label: {
                    SettingsItemView(item: item)
                }

                Color.secondaryBackground
                    .frame(height: 1)
            }
        }
    }
}

struct SettingsListView_Previews: PreviewProvider {
    
    static var previews: some View {
        SettingsListView(viewModel: SettingsViewModel(paywallService: ApphudPaywallService(apiKey: Constant.APIKey.apphud)))
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
