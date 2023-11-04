//
//  PlayerUIView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 04.07.2023.
//
import AVKit
import SwiftUI

class PlayerUIView: UIView {
    
    // MARK: - Public Properties
    let playerViewController = AVPlayerViewController()
    
    var player: AVPlayer? {
        get { playerViewController.player }
        set { playerViewController.player = newValue }
    }
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(player: AVPlayer) {
        super.init(frame: .zero)
        setupPlayer(player)
    }
    
    // MARK: - View Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        playerViewController.view.frame = bounds
    }
    
    // MARK: - Private Methods
    private func setupPlayer(_ player: AVPlayer) {
        self.player = player
        playerViewController.view.backgroundColor = .clear
        addSubview(playerViewController.view)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(playerDidFinishPlaying),
            name: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem
        )
    }
    
    @objc private func playerDidFinishPlaying() {
        player?.seek(to: .zero)
        player?.play()
    }
}
