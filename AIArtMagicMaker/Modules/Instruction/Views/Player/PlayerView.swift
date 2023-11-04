//
//  PlayerView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 04.07.2023.
//
import AVKit
import SwiftUI

struct PlayerView: UIViewRepresentable {
    
    // MARK: - Public Properties
    @Binding var player: AVPlayer
    
    // MARK: - UIViewRepresentable
    func makeUIView(context: Context) -> PlayerUIView {
        PlayerUIView(player: player)
    }
    
    func updateUIView(_ uiView: PlayerUIView, context: UIViewRepresentableContext<PlayerView>) {
        uiView.player = player
    }
}
