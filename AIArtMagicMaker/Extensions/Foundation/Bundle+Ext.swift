//
//  Bundle+Ext.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 27.06.2023.
//

import Foundation

// MARK: - Public Properties
extension Bundle {
    
    var versionNumber: String {
        infoDictionary?["CFBundleShortVersionString"] as! String
    }

    var buildNumber: String {
        infoDictionary?["CFBundleVersion"] as! String
    }
}
