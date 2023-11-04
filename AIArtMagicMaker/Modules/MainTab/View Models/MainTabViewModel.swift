//
//  MainTabViewModel.swift
//  AIArtMagicMaker
//
//  Created by Yurii Marhitych on 04.07.2023.
//

import Foundation
import Combine
import PhotosUI

@MainActor
final class MainTabViewModel: ObservableObject {

    // MARK: - Public Properties
    let tabs = Tab.allCases
    let artStyles = ArtStyle.allCases
    let imageSources = ImageSource.allCases

    private(set) var selectedArtStyle: ArtStyle? {
        get {
            switch artStylePickerDestination {
            case .fromTextGeneration:
                return fromTextViewModel.selectedArtStyle
            case .fromImageGeneration:
                return fromImageViewModel.selectedArtStyle
            case .artResult:
                return artResultViewModel.selectedArtStyle
            case .none:
                return nil
            }
        }

        set {
            switch artStylePickerDestination {
            case .fromTextGeneration:
                fromTextViewModel.selectedArtStyle = newValue
            case .fromImageGeneration:
                fromImageViewModel.selectedArtStyle = newValue
            case .artResult:
                artResultViewModel.selectedArtStyle = newValue
            case .none:
                fatalError("ArtStylePickerDestination can not be nil.")
            }
        }
    }

    // MARK: View Models
    lazy var fromImageViewModel: FromImageViewModel = {
        let viewModel = FromImageViewModel(
            paywallService: paywallService,
            artStyles: artStyles
        ) { [weak self] in
            self?.artStylePickerDestination = .fromImageGeneration
            self?.isArtStylePickerPresented.toggle()
        }

        viewModel.$isImageSourcePickerPresented
            .receive(on: RunLoop.main)
            .assign(to: &$isImageSourcePickerPresented)

        viewModel.$isInstructionPresented
            .receive(on: RunLoop.main)
            .assign(to: &$isFromImageInstructionPresented)

        viewModel.$isGenerationsLeftPresented
            .receive(on: RunLoop.main)
            .assign(to: &$isGenerationsLeftPresented)

        return viewModel
    }()

    lazy var fromTextViewModel: FromTextViewModel = {
        let viewModel = FromTextViewModel(
            paywallService: paywallService,
            artStyles: artStyles
        ) { [weak self] in
            self?.artStylePickerDestination = .fromTextGeneration
            self?.isArtStylePickerPresented.toggle()
        }

        viewModel.$isGenerationsLeftPresented
            .receive(on: RunLoop.main)
            .assign(to: &$isGenerationsLeftPresented)

        return viewModel
    }()

    var myArtsViewModel: MyArtsViewModel {
        let viewModel = MyArtsViewModel(
        ) { [weak self] generationType in
            switch generationType {
            case .fromImage:
                self?.selectedTab = .fromImage
            case .fromText:
                self?.selectedTab = .fromText
            }
        }

        viewModel.$isArtResultPresented
            .receive(on: RunLoop.main)
            .assign(to: &$isResultPresented)

        return viewModel
    }

    var settingsViewModel: SettingsViewModel {
        SettingsViewModel(paywallService: paywallService)
    }

    var paywallViewModel: PaywallViewModel {
        PaywallViewModel(paywallService: paywallService)
    }

    var artResultViewModel: ArtResultViewModel {
        ArtResultViewModel(paywallService: paywallService)
    }

    @Published var selectedTab = Tab.fromText
    @Published var hudType: HudType?
    @Published var accessAlertType: AccessAlertType?
    @Published var isPaywallPresented = false
    @Published var isFromImageInstructionPresented = false
    @Published var isResultPresented = false
    @Published var isArtStylePickerPresented = false
    @Published var isImageSourcePickerPresented = false
    @Published var isGenerationsLeftPresented = false

    // MARK: - Private Properties
    private let paywallService: PaywallService
    private var artStylePickerDestination: ArtStylePickerDestination?
    private var subscriptions = Set<AnyCancellable>()

    // MARK: - Initializers
    init(paywallService: PaywallService) {
        self.paywallService = paywallService
        configureBindings()
        subscriptions = configureHuds()
    }

    // MARK: - Public Methods
    func onTapGetPro() {
        isPaywallPresented.toggle()
    }

    func onTapWatchAd() {

    }

    func onSelectArtStyle(_ style: ArtStyle) {
        selectedArtStyle = style
    }

    func onSelectImageSource(_ source: ImageSource) {
        Task {
            let isAuthorized = await (source == .camera ? getCameraAuthorization() : getPhotoLibraryAuthorization())
            if isAuthorized {
                fromImageViewModel.onSelectImageSource(source)
            } else {
                Hud.showAccessAlert(ofType: source == .camera ? .camera : .photoLibrary)
            }
        }
    }

    // MARK: - Private Methods
    private func getCameraAuthorization() async -> Bool {
        await AVCaptureDevice.requestAccess(for: .video)
    }

    private func getPhotoLibraryAuthorization() async -> Bool {
        let status = await PHPhotoLibrary.requestAuthorization(for: .readWrite)
        return status == .authorized || status == .limited
    }

    private func configureBindings() {
        configureNotificationCenterBindings()
    }

    private func configureNotificationCenterBindings() {
        NotificationCenter.default.publisher(for: .showPaywall)
            .receive(on: RunLoop.main)
            .map { _ in true }
            .assign(to: &$isPaywallPresented)
    }
}

// MARK: - Helper Types
private extension MainTabViewModel {

    enum ArtStylePickerDestination {

        // MARK: - Cases
        case fromTextGeneration
        case fromImageGeneration
        case artResult
    }
}

// MARK: - HudPresenter
extension MainTabViewModel: HudPresenter { }
