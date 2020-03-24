//
//  TemporaryImageCache.swift
//  RickAndMorty-SwiftUI-Combine
//
//  Created by Developer on 24.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

protocol ImageCache {
    subscript(_ url: URL) -> UIImage? { get set }
}

struct TemporaryImageCache: ImageCache {
    private let cache = NSCache<NSURL, UIImage>()
    
    subscript(url: URL) -> UIImage? {
        get { cache.object(forKey: url as NSURL) }
        set { newValue == nil ? cache.removeObject(forKey: url as NSURL) : cache.setObject(newValue!, forKey: url as NSURL)}
    }
}
