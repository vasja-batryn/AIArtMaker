//
//  InstructionViewModel.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 04.07.2023.
//

import Foundation
import AVKit

final class InstructionViewModel: ObservableObject {
    
    // MARK: - Public Properties
    @Published var player = AVPlayer(url: Constant.AppURL.videoInstruction)

    // MARK: - Public Methods
    func onAppear() {
        player.play()
    }
}
