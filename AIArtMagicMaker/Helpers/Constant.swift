//
//  Constant.swift
//  AIArtMagicMaker
//
//  Created by Yurii Marhitych on 03.07.2023.
//
import Foundation

enum Constant { }

// MARK: - Support
extension Constant {
    
    enum Support {
        
        static let email = "lovepets@lovepetsapp.com"
        
        static func defaultEmailText(isHTML: Bool, userId: String) -> String {
            let paragraphOpen = isHTML ? "<p>" : ""
            let paragraphClose = isHTML ? "</p>" : ""
            let newLine = isHTML ? "<br>" : "\n"
            return "\(paragraphOpen)User ID: \(userId)" +
            "\(newLine)Version Number: " +
            "\(newLine)Build Number: " +
            paragraphClose
        }
    }
}

// MARK: - URLs
extension Constant {
    
    enum AppURL {
        
        static let privacyPolicy = URL(string: "https://www.apple.com")!
        static let termsOfUse = URL(string: "https://www.apple.com")!
        static let rateApp = URL(string: "https://www.apple.com")!
        static let videoInstruction = URL(fileURLWithPath: Bundle.main.path(forResource: "ImageFromImageInstruction", ofType: "mov")!)
    }
}

// MARK: - API Keys
extension Constant {
    
    enum APIKey {
        
        static let apphud = "app_pHgHSLVjDHJXhvZ8MgJxEmhi3sCd6N"
    }
}
