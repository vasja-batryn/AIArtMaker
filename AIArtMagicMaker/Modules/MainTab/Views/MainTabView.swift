//
//  MainTabView.swift
//  AIArtMagicMaker
//
//  Created by Yurii Marhitych on 16.06.2023.
//

import SwiftUI

struct MainTabView: View {
    
    // MARK: - Public Properties
    @StateObject var viewModel: MainTabViewModel

    // MARK: - View Properties
    var body: some View {
        NavigationStack {
            tabView
                .artStylePicker(
                    isPresented: $viewModel.isArtStylePickerPresented,
                    styles: viewModel.artStyles,
                    selectedStyle: viewModel.selectedArtStyle
                ) { artStyle in
                    viewModel.onSelectArtStyle(artStyle)
                }
                .imageSourcePicker(
                    isPresented: $viewModel.isImageSourcePickerPresented,
                    sources: viewModel.imageSources
                ) { imageSource in
                    viewModel.onSelectImageSource(imageSource)
                }
                .generationsLeft(
                    isPresented: $viewModel.isGenerationsLeftPresented,
                    onTapGetPro: {
                        viewModel.onTapGetPro()
                    },
                    onTapWatchAd: {
                        viewModel.onTapWatchAd()
                    }
                )
                .navigationDestination(isPresented: $viewModel.isFromImageInstructionPresented) {
                    InstructionView()
                }
                .navigationDestination(isPresented: $viewModel.isResultPresented) {
                    ArtResultView(viewModel: viewModel.artResultViewModel)
                        .navigationBarBackButtonHidden(true)
                }
                .fullScreenCover(isPresented: $viewModel.isPaywallPresented) {
                    PaywallView(viewModel: viewModel.paywallViewModel)
                }
        }
        .hudView(type: $viewModel.hudType)
        .accessAlert(ofType: $viewModel.accessAlertType)
        .accentColor(.primaryText)
        .onAppear(perform: setupTabBatAppearance)
    }
    
    private var tabView: some View {
        TabView(selection: $viewModel.selectedTab) {
            ForEach(viewModel.tabs) { tab in
                view(for: tab)
            }
        }
    }
    
    // MARK: - Private Methods
    @ViewBuilder private func view(for tab: Tab) -> some View {
        Group {
            switch tab {
            case .fromText:
                FromTextView(viewModel: viewModel.fromTextViewModel)
            case .fromImage:
                FromImageView(viewModel: viewModel.fromImageViewModel)
            case .myArts:
                MyArtsView(viewModel: viewModel.myArtsViewModel)
            case .settings:
                SettingsView(viewModel: viewModel.settingsViewModel)
            }
        }
        .tag(tab)
        .tabItem {
            Image(tab.imageName(isActive: viewModel.selectedTab == tab))
            Text(tab.title)
        }
    }
    
    private func setupTabBatAppearance() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(.tertiaryText)
        UITabBar.appearance().backgroundColor = UIColor(.background)
    }
}

struct MainTabView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainTabView(viewModel: MainTabViewModel(paywallService: ApphudPaywallService(apiKey: Constant.APIKey.apphud)))
    }
}
