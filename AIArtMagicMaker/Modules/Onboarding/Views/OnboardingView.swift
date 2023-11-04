//
//  OnboardingView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 17.06.2023.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK: - Public Properties
    @StateObject var viewModel: OnboardingViewModel
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Button {
                    viewModel.didTapBackButton()
                } label: {
                    Image.chevronLeft
                        .resizableToFit(width: 44, height: 44)
                }
                .opacity(viewModel.isFirstPage ? 0 : 1)
                .animation(.spring(), value: viewModel.isFirstPage)
                
                Spacer()
                
                CloseButton {
                    viewModel.didTapCloseButton()
                }
                .opacity(viewModel.isLastPage ? 1 : 0)
                .animation(
                    .spring().delay(viewModel.isLastPage ? 2.5 : 0),
                    value: viewModel.isLastPage
                )
            }
            .padding(.horizontal)
            
            GeometryReader { geometry in
                ForEach(viewModel.pages) { page in
                    OnboardingPageView(
                            imageName: page.image,
                            title: page.title,
                            description: viewModel.description(for: page)
                    )
                    .offset(x: -geometry.size.width * CGFloat(viewModel.currentPageIndex - (viewModel.pages.firstIndex(of: page) ?? 0)))
                }
            }
            .animation(.spring(), value: viewModel.currentPageIndex)
            
            Spacer()
            
            PageIndicator(
                numberOfPages: viewModel.numberOfPages,
                currentPage: $viewModel.currentPageIndex
            )
            
            PrimaryButton(title: viewModel.isLastPage ? "Let's Start" : "Continue") {
                viewModel.didTapPrimaryButton()
            }
            .animation(.spring(), value: viewModel.isLastPage)
            .padding()
            
            FooterView(
                actionButtonTitle: "Restore",
                actionButtonAction: { viewModel.restorePurchases() }
            )
        }
        .background {
            Color.background
                .ignoresSafeArea()
        }
        .hudView(type: $viewModel.hudType)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            let paywallService = ApphudPaywallService(apiKey: Constant.APIKey.apphud)
            let viewModel = OnboardingViewModel(paywallService: paywallService)
            
            OnboardingView(viewModel: viewModel)
                .previewDisplayName("Current")
            
            OnboardingView(viewModel: viewModel)
                .previewDevice(PreviewDevice(stringLiteral: "iPhone 8"))
                .previewDisplayName("iPhone 8")
        }
    }
}
