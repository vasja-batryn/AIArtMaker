//
//  PaywallPresenter.swift
//  AIArtMagicMaker
//
//  Created by Yurii Marhitych on 20.07.2023.
//

import Foundation

// MARK: - Requirements
protocol PaywallPresenter: AnyObject { }

// MARK: - Default Implementation
extension PaywallPresenter {
    
    func showPaywall() {
        NotificationCenter.default.post(
            name: .showPaywall,
            object: nil
        )
    }
}
