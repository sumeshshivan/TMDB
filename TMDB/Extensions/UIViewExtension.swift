//
//  UIViewExtension.swift
//  TMDB
//
//  Created by sumesh shivan on 09/03/22.
//

import UIKit

extension UIView {
    func setRoundeCorner(radius: CGFloat = 4.0) {
        self.layer.cornerRadius = radius
    }
    
    func setRoundeBorder(radius: CGFloat = 4.0) {
        self.layer.cornerRadius = radius
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.primary.cgColor
    }
}
