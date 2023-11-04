//
//  ArtResultView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 18.07.2023.
//

import SwiftUI

struct ArtResultView: View {

    // MARK: - Public Properties
    @StateObject var viewModel: ArtResultViewModel

    // MARK: - Private Properties
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            HStack {
                CloseButton(action: dismiss.callAsFunction)

                Spacer()

                SecondaryButton(
                    title: "Watermark",
                    icon: .starWithEffect,
                    action: {}
                )
                .disabled(!viewModel.isWatermarkEnabled)
                .allowsHitTesting(false)

                Toggle(isOn: $viewModel.isWatermarkEnabled) {}
                    .labelsHidden()
                    .toggleStyle(SwitchToggleStyle(tint: .quaternaryGradient))
                    .onChange(of: viewModel.isWatermarkEnabled) { newValue in
                        viewModel.watermarkStateDidChange(newValue: newValue)
                    }
            }

            Spacer()

            VStack(spacing: 49) {
                if viewModel.isFromTextToPicture {
                    VStack(spacing: 12) {
                        HStack {
                            Text("Style:")
                                .font(.system(size: 19, weight: .semibold))

                            Spacer()

                            Button(action: viewModel.onTapSeelAllStyles) {
                                HStack(spacing: 5) {
                                    Text(viewModel.selectedArtStyle?.description ?? "")
                                        .font(.system(size: 18, weight: .regular))
                                    Image.chevronRight
                                        .resizableToFit(width: 32, height: 32)
                                }
                            }
                        }

                        TextField("", text: $viewModel.promptText, axis: .vertical)
                            .lineLimit(4, reservesSpace: true)
                            .font(.system(size: 16, weight: .regular))
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(LinearGradient.pageIndicatorActive, lineWidth: 1)
                            )
                    }
                    .foregroundColor(.primaryText)
                }

                HStack {
                    CircleButton(
                        title: "Regenerate",
                        icon: .regenerate,
                        action: { viewModel.onTapRegenerate() }
                    )

                    Spacer()

                    ShareLink(
                        item: viewModel.sharedImage,
                        preview: SharePreview("Image", image: viewModel.sharedImage)
                    ) {
                        CircleButton(
                            title: "Share",
                            icon: .share,
                            isFilled: true,
                            action: {}
                        )
                        .allowsHitTesting(false)
                    }

                    Spacer()

                    CircleButton(
                        title: "Save",
                        icon: .save,
                        action: { viewModel.onTapSave() }
                    )
                }
                .padding(.horizontal, 9)
            }
        }
        .padding()
        .background(
            Color.background
                .ignoresSafeArea()
        )
        .generationsLeft(
            isPresented: $viewModel.isGenerationsLeftPresented,
            onTapGetPro: {
                viewModel.onTapTryProNow()
            },
            onTapWatchAd: {
                viewModel.onTapWatchAd()
            }
        )
        .artStylePicker(
            isPresented: $viewModel.isSelectArtStylePresented,
            styles: viewModel.artStyles,
            selectedStyle: viewModel.selectedArtStyle
        ) { selectedStyle in
            viewModel.onSelectStyle(selectedStyle)
        }
    }
}

struct ArtResultView_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            ArtResultView(viewModel: ArtResultViewModel(paywallService: ApphudPaywallService(apiKey: Constant.APIKey.apphud)))
        }
    }
}
