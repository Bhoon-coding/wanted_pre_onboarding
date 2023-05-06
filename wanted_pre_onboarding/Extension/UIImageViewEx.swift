//
//  UIImageView + extension.swift
//  wanted_pre_onboarding
//
//  Created by BH on 2022/06/14.
//

import Foundation
import UIKit

extension UIImageView {
    func load(urlString: String) {
        // 1. 저장된 캐시키가 있으면 이미지 바로 보여주기
        let cachedKey = NSString(string: urlString)
        if let cachedImage = ImageCacheManager.shared.object(forKey: cachedKey) {
            DispatchQueue.main.async {
                self.image = cachedImage
                return
            }
        }
        
        guard let iconUrl = URL(string: urlString) else { return }
        // 2. 없으면 아래 네트워킹 호출해서 이미지url을 받아오기
        URLSession.shared.dataTask(with: iconUrl) { data, _, error in
            guard error == nil else {
                DispatchQueue.main.async { [weak self] in
                    self?.image = UIImage()
                }
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                if let data = data,
                   let image = UIImage(data: data) {
                    // 3. 받아온 이미지url(value), image(key) 저장
                    ImageCacheManager.shared.setObject(image, forKey: cachedKey)
                    self?.image = image
                }
            }
        }.resume()
    }
}

