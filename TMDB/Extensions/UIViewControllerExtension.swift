//
//  UIViewControllerExtension.swift
//  TMDB
//
//  Created by sumesh shivan on 09/03/22.
//

import UIKit

struct AlertMessage {
    var tittle: String?
    var message: String?
}

extension UIViewController {
    func show(alert: AlertMessage) {
        let alert = UIAlertController(title: alert.tittle,
                                      message: alert.message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
