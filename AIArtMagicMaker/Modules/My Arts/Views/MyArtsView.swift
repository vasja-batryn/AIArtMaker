//
//  MyArtsView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 28.06.2023.
//

import SwiftUI

struct MyArtsView: View {

    // MARK: - Public Properties
    @StateObject var viewModel: MyArtsViewModel

    // MARK: - Private Properties
    private let spacing: CGFloat = 12
    private var columns: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: spacing), count: 2)
    }

    // MARK: - Body
    var body: some View {
        VStack(spacing: 36) {
            HStack {
                Text("My Arts")
                    .font(.system(size: 28, weight: .semibold))

                Spacer()

                SecondaryButton(
                    title: "PRO",
                    icon: .starWithEffect,
                    action: { viewModel.onTapTryProNow() }
                )
            }
            .padding(.top)

            PickerView(
                types: viewModel.generationTypes,
                selectedTab: $viewModel.selectedPickerTab
            )

            if viewModel.isEmptyState {
                VStack {
                    Text("Looks like you don't have \nany Arts yet")
                        .font(.system(size: 22, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .frame(maxHeight: .infinity)

                    TertiaryButton(
                        title: "Start Generating",
                        action: { viewModel.onTapStartGenerating() }
                    )
                    .padding(.bottom)
                }
            } else {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: columns, spacing: spacing) {
                        ForEach(viewModel.arts) { art in
                            ArtView(
                                image: art.image,
                                onTap: { viewModel.onTapArt() }
                            )
                        }
                    }
                }
            }
        }
        .foregroundColor(.primaryText)
        .padding(.horizontal)
        .background {
            Color.background
                .ignoresSafeArea()
        }
    }
}

struct MyArtsView_Previews: PreviewProvider {
    
    static var previews: some View {
        MyArtsView(viewModel: MyArtsViewModel(onStartGenerating: {_ in }))
    }
}
