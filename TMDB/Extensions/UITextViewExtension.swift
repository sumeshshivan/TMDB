//
//  UILabelExtension.swift
//  Grabacon
//
//  Created by sumesh shivan on 19/12/20.
//  Copyright © 2020 Justforlocks. All rights reserved.
//

import UIKit

extension UITextView {
    func addHyperLinks(_ links: [String: String]) {
        if let textString = self.text {
            let nsString = NSString(string: textString)
            let attributedString = NSMutableAttributedString(string: textString)
            
            for (key, url)  in links {
                let substringRange = nsString.range(of: key)
                attributedString.addAttribute(.link, value: url, range: substringRange)
                attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: substringRange)
            }
            
            self.attributedText = attributedString
        }
    }
}
