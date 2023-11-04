//
//  View+Ext.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 18.07.2023.
//

import SwiftUI

// MARK: - Public Methods
extension View {
    
    func accessAlert(
        ofType type: Binding<AccessAlertType?>
    ) -> some View {
        alert(type.wrappedValue?.title ?? .empty, isPresented: Binding(
            get: { type.wrappedValue != nil },
            set: { isPresented in
                guard !isPresented else { return }
                type.wrappedValue = nil
            }
        )) {
            Button("Cancel", role: .cancel) { }
            
            Button("Open Settings") {
                guard
                    let url = URL(string: UIApplication.openSettingsURLString),
                    UIApplication.shared.canOpenURL(url)
                else { return }
                
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }.keyboardShortcut(.defaultAction)
        } message: {
            Text(type.wrappedValue?.message ?? .empty)
        }
    }
}
