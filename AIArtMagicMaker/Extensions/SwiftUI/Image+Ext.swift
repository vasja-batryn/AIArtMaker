//
//  Image+Ext.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 17.06.2023.
//

import SwiftUI

// MARK: - Constants
extension Image {
    
    static let chevronRight = Image("ArrowRight")
    static let chevronLeft = Image("ArrowLeft")
    static let close = Image("Close")
    static let star = Image("Star")
    static let starWithEffect = Image("StarWithEffect")
    static let city = Image("City")
    static let paywallImage = Image("PaywallImage")
    static let circleIcon = Image("Circle")
    static let checkmarkCircle = Image("CheckmarkCircle")
    static let help = Image("Help")
    static let copy = Image("Copy")
    static let info = Image("Info")
    static let closeXmark = Image("CloseXmark")
    static let addPhoto = Image("AddPhoto")
    static let regenerate = Image("Regenerate")
    static let share = Image("Share")
    static let save = Image("Save")
    static let camera = Image("Camera")
    static let gallery = Image("Gallery")
    
    // Tab Bar
    static let fromText = Image("FromText")
    static let fromImage = Image("FromImage")
    static let fromImageActive = Image("FromImageActive")
    static let myArts = Image("MyArts")
    static let myArtsActive = Image("MyArtsActive")
    static let settings = Image("Settings")
    static let settingsActive = Image("SettingsActive")
}

// MARK: - Public Methods
extension Image {
    
    /// Resize image to fit the desired width and height.
    func resizableToFit(
        width: CGFloat,
        height: CGFloat
    ) -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: width, height: height)
    }
}
