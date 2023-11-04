//
//  MailType.swift
//  AIArtMagicMaker
//
//  Created by Yurii Marhitych on 27.06.2023.
//

import UIKit

enum MailType: String {
    
    // MARK: - Cases
    case complaint
    case support

    // MARK: - Public Properties
    var subject: String {
        switch self {
        case .complaint:
            return "Complaint"
        case .support:
            return "Support & Contact Us"
        }
    }
    
    var emailToURL: URL? {
        let userId = UserDefaults.standard.string(forKey: .apphudUserID) ?? "unknown"
        
        guard
            let recipientEncoded = Constant.Support.email.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let subjectEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let bodyEncoded = Constant.Support.defaultEmailText(isHTML: false, userId: userId).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        else { return nil }
        
        let gmailUrl = URL(string: "googlegmail://co?to=\(recipientEncoded)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
        let outlookUrl = URL(string: "ms-outlook://compose?to=\(recipientEncoded)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
        let yahooMail = URL(string: "ymail://mail/compose?to=\(recipientEncoded)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
        let sparkUrl = URL(string: "readdle-spark://compose?recipient=\(recipientEncoded)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
        let defaultUrl = URL(string: "mailto:\(recipientEncoded)?subject=\(subjectEncoded)&body=\(bodyEncoded)")
        
        if let gmailUrl = gmailUrl, UIApplication.shared.canOpenURL(gmailUrl) {
            return gmailUrl
        } else if let outlookUrl = outlookUrl, UIApplication.shared.canOpenURL(outlookUrl) {
            return outlookUrl
        } else if let yahooMail = yahooMail, UIApplication.shared.canOpenURL(yahooMail) {
            return yahooMail
        } else if let sparkUrl = sparkUrl, UIApplication.shared.canOpenURL(sparkUrl) {
            return sparkUrl
        }
        
        return defaultUrl
    }
}

// MARK: - Identifiable
extension MailType: Identifiable {
    
    var id: String { rawValue }
}
