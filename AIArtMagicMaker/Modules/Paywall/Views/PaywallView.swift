//
//  PaywallView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 26.06.2023.
//

import SwiftUI

struct PaywallView: View {
    
    // MARK: - Public Properties
    @StateObject var viewModel: PaywallViewModel
    
    // MARK: - Private Properties
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Body
    var body: some View {
        GeometryReader { proxy in
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Image.paywallImage
                        .resizable()
                        .scaledToFill()
                        .frame(height: proxy.size.height * 0.25)
                        .overlay(alignment: .topLeading) {
                            CloseButton(action: dismiss.callAsFunction)
                                .padding(.horizontal)
                                .padding(.top, 44)
                                .opacity(viewModel.isCloseVisible ? 1 : 0)
                                .animation(
                                    .easeInOut(duration: 1.5),
                                    value: viewModel.isCloseVisible
                                )
                        }
                    
                    Group {
                        AppFeaturesList()

                        PaywallPlansList(
                            plans: viewModel.plans,
                            selectedPlan: $viewModel.selectedPlan
                        )
                        .padding(.top)

                        PrimaryButton(title: "Buy Premium") {
                            viewModel.buyPremium()
                        }
                        .padding(.vertical)

                        Text(viewModel.footerText)
                            .foregroundColor(.tertiaryText)
                            .font(.system(size: 12, weight: .regular))
                            .multilineTextAlignment(.center)

                        FooterView(
                            actionButtonTitle: "Restore",
                            actionButtonAction: { viewModel.restorePurchases() }
                        )
                    }
                    .padding(.horizontal)
                }
            }
            .edgesIgnoringSafeArea(.top)
            .background {
                Color.background
                    .ignoresSafeArea()
            }
            .alert(item: $viewModel.error) { error in
                Alert(title: Text("Error"), message: Text(error.message), dismissButton: .default(Text("OK")))
            }
        }
        .onAppear { viewModel.onAppear() }
    }
}

struct PaywallView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            PaywallView(viewModel: PaywallViewModel(paywallService: ApphudPaywallService(apiKey: Constant.APIKey.apphud)))
                .previewDisplayName("Current")
            
            PaywallView(viewModel: PaywallViewModel(paywallService: ApphudPaywallService(apiKey: Constant.APIKey.apphud)))
                .previewDevice(PreviewDevice(stringLiteral: "iPhone 8"))
                .previewDisplayName("iPhone 8")
        }
    }
}
