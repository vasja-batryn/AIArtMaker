//
//  FooterView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 17.06.2023.
//

import SwiftUI

struct FooterView: View {

    // MARK: - Public Properties
    let actionButtonTitle: String
    let actionButtonAction: () -> Void

    // MARK: - Private Properties
    @State private var url: URL?

    // MARK: - Body
    var body: some View {
        HStack(spacing: 12) {
            Button("Privacy Policy") {
                url = Constant.AppURL.privacyPolicy
            }
            Dot()
            Button("Terms of Use") {
                url = Constant.AppURL.termsOfUse
            }
            Dot()
            Button(actionButtonTitle, action: actionButtonAction)
        }
        .font(.system(size: 15, weight: .medium))
        .foregroundColor(.primaryText)
        .padding()
        .sheet(item: $url) { url in
            SFSafariView(url: url)
        }
    }
}

// MARK: - Helper Types
private struct Dot: View {
    
    var body: some View {
        Circle()
            .frame(width: 4, height: 4)
    }
}

struct FooterView_Previews: PreviewProvider {
    
    static var previews: some View {
        FooterView(actionButtonTitle: "Restore", actionButtonAction: {})
            .background(Color.background)
            .previewLayout(.sizeThatFits)
    }
}
