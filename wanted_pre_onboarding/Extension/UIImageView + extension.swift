//
//  UIImageView + extension.swift
//  wanted_pre_onboarding
//
//  Created by BH on 2022/06/14.
//

import Foundation
import UIKit

// 1
var imageCache = NSCache<AnyObject, AnyObject>()
extension UIImageView {
    func load(urlString: String) {
        
        // 3
        if let image = imageCache.object(forKey: urlString as NSString) as? UIImage {
            self.image = image
            return
        }
        guard let iconUrl = URL(string: urlString) else {
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: iconUrl) {
                if let image = UIImage(data: data) {
                    
                    DispatchQueue.main.async {
                        // 2
                        imageCache.setObject(image, forKey: urlString as NSString)
                        self?.image = image
                    }
                }
            }
        }
    }
    
}
