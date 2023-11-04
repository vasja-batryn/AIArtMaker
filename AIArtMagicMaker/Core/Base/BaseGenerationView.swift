//
//  BaseGenerationView.swift
//  AIArtMagicMaker
//
//  Created by Yurii Marhitych on 20.07.2023.
//

import SwiftUI

struct BaseGenerationView<Content: View, Title: View, ViewModel: BaseGenerationViewModel>: View {
    
    // MARK: - Public Properties
    @ObservedObject var viewModel: ViewModel
    @ViewBuilder let title: () -> Title
    @ViewBuilder let content: (CGSize) -> Content
    
    // MARK: - Private Properties
    private let spacing: CGFloat = 30
    
    // MARK: - View Properties
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: spacing) {
                headerView
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: spacing) {
                        content(geometry.size)
                    }
                }
            }
            .background {
                Color.background
                    .ignoresSafeArea()
            }
        }
    }
    
    private var headerView: some View {
        HStack {
            title()
            
            Spacer()
            
            SecondaryButton(title: "PRO", icon: .starWithEffect) {
                viewModel.onTapTryPro()
            }
        }
        .padding([.top, .horizontal])
    }
}

struct BaseGenerationView_Previews: PreviewProvider {
    
    static var previews: some View {
        BaseGenerationView(
            viewModel: BaseGenerationViewModel(
                paywallService: ApphudPaywallService(apiKey: .empty),
                artStyles: ArtStyle.allCases,
                onTapSeeAllArtStyles: {}
            ),
            title: {
                Text("Title")
                    .font(.system(size: 28, weight: .semibold))
                    .foregroundColor(.primaryText)
            },
            content: { _ in
                Text("Content")
            }
        )
    }
}
