//
//  UIImageViewExtension.swift
//  TMDB
//
//  Created by sumesh shivan on 09/03/22.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    func imageURLLoad(url: URL) {
        DispatchQueue.global().async { [weak self] in
            func setImage(image:UIImage?) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
            let urlToString = url.absoluteString as NSString
            if let cachedImage = imageCache.object(forKey: urlToString) {
                setImage(image: cachedImage)
            } else if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    imageCache.setObject(image, forKey: urlToString)
                    setImage(image: image)
                }
            } else {
                setImage(image: nil)
            }
        }
    }
}
