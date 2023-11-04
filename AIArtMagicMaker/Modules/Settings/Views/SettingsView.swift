//
//  SettingsView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 21.06.2023.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - Public Properties
    @StateObject var viewModel: SettingsViewModel
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            Text("Settings")
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(.primaryText)
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 16) {
                        AppFeaturesList()
                        
                        SecondaryButton(
                            title: "Try PRO Now",
                            icon: .starWithEffect,
                            action: { viewModel.onTapTryProNow() }
                        )
                    }
                    .padding(20)
                    .background {
                        Image.city
                            .resizable()
                            .scaledToFill()
                    }
                    .cornerRadius(16)
                    
                    SettingsListView(viewModel: viewModel)
                    
                    Spacer()
                }
                .padding([.top, .horizontal])
            }
        }
        .background(Color.background.ignoresSafeArea())
        .sheet(item: $viewModel.url) { url in
            SFSafariView(url: url)
        }
        .sheet(item: $viewModel.mailType) { type in
            MailView(type: type)
        }
        .fullScreenCover(isPresented: $viewModel.showPaywall) {
            PaywallView(viewModel: viewModel.paywallViewModel)
        }
        .alert(item: $viewModel.error) { error in
            Alert(title: Text("Error"), message: Text(error.message), dismissButton: .default(Text("OK")))
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            SettingsView(viewModel: SettingsViewModel(paywallService: ApphudPaywallService(apiKey: Constant.APIKey.apphud)))
                .previewDisplayName("Current")
            
            SettingsView(viewModel: SettingsViewModel(paywallService: ApphudPaywallService(apiKey: Constant.APIKey.apphud)))
                .previewDisplayName("iPhone 8")
                .previewDevice(PreviewDevice(stringLiteral: "iPhone 8"))
        }
    }
}
