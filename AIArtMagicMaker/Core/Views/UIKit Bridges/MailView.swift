//
//  MailView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 23.06.2023.
//

import SwiftUI
import MessageUI

struct MailView: UIViewControllerRepresentable {

    // MARK: - Helper Types
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {

        let parent: MailView

        init(_ parent: MailView) {
            self.parent = parent
        }

        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            controller.dismiss(animated: true)
        }
    }

    // MARK: - Public Static Properties
    static var canSendMail: Bool {
        MFMailComposeViewController.canSendMail()
    }
    
    // MARK: - Public Properties
    let type: MailType

    // MARK: - MFMailComposeViewController
    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        let viewController = MFMailComposeViewController()
        let userId = UserDefaults.standard.string(forKey: .apphudUserID) ?? "unknown"
        let emailText = Constant.Support.defaultEmailText(isHTML: true, userId: userId)
        
        viewController.mailComposeDelegate = context.coordinator
        viewController.setToRecipients([Constant.Support.email])
        viewController.setSubject(type.subject)
        viewController.setMessageBody(emailText, isHTML: true)
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
