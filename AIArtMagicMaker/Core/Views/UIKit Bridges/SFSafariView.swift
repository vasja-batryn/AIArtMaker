//
//  SFSafariView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 17.06.2023.
//

import SwiftUI
import SafariServices

struct SFSafariView: UIViewControllerRepresentable {
    
    // MARK: - Public Properties
    let url: URL
    
    // MARK: - UIViewControllerRepresentable
    func makeUIViewController(context: Context) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) { }
}

