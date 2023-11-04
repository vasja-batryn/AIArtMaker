//
//  TextField+Ext.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 11.07.2023.
//

import SwiftUI

extension TextField {
    
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        ZStack(alignment: alignment) {
            placeholder()
                .opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
