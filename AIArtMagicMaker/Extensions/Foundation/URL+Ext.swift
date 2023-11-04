//
//  URL+Ext.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 17.06.2023.
//

import Foundation

// MARK: - Identifiable
extension URL: Identifiable {
    
    public var id: String {
        absoluteString
    }
}
