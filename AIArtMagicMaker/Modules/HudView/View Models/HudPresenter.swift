//
//  HudPresenter.swift
//  AIArtMagicMaker
//
//  Created by Yurii Marhitych on 20.07.2023.
//

import Foundation
import Combine

// MARK: - Requirements
protocol HudPresenter: AnyObject {
    
    var hudType: HudType? { get set }
    var accessAlertType: AccessAlertType? { get set }
    
    func configureHuds() -> Set<AnyCancellable>
}

// MARK: - Default Implementation
extension HudPresenter {
    
    func configureHuds() -> Set<AnyCancellable> {
        var subscriptions = Set<AnyCancellable>()
        
        NotificationCenter.default.publisher(for: .showHud)
            .receive(on: RunLoop.main)
            .map { $0.object as? HudType }
            .assign(to: \.hudType, on: self)
            .store(in: &subscriptions)
        
        NotificationCenter.default.publisher(for: .showAccessDenied)
            .receive(on: RunLoop.main)
            .map { $0.object as? AccessAlertType }
            .assign(to: \.accessAlertType, on: self)
            .store(in: &subscriptions)
        
        return subscriptions
    }
}
