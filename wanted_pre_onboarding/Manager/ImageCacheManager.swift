//
//  ImageCacheManager.swift
//  wanted_pre_onboarding
//
//  Created by BH on 2022/06/16.
//


import UIKit

final class ImageCacheManager {
    static let shared = NSCache<NSString, UIImage>()
    private init() { }
}
