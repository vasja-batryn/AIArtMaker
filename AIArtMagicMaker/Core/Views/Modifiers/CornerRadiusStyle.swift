//
//  CornerRadiusStyle.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 10.07.2023.
//

import SwiftUI

struct CornerRadiusStyle: ViewModifier {
    
    // MARK: - Public Properties
    var radius: CGFloat
    var corners: UIRectCorner
    
    struct CornerRadiusShape: Shape {
        
        // MARK: - Public Properties
        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners
        
        // MARK: - Path
        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }

    // MARK: - Body
    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

// MARK: - View+CornerRadius
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}
