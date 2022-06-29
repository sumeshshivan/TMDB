//
//  Storyboarded.swift
//  TMDB
//
//  Created by sumesh shivan on 09/03/22.
//

import UIKit

protocol Storyboarded {
    static var storyboardName: StoryboardName { get set }
    static func instatiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instatiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as? Self ?? .init()
    }
}
