//
//  ImageStore.swift
//  Homepwner
//
//  Created by Christian Perrone on 14/10/16.
//  Copyright © 2016 Christian Perrone. All rights reserved.
//

import Foundation

import UIKit

class ImageStore: NSObject {
    
    let cache: NSCache<AnyObject,AnyObject> = NSCache()
    
    func setImage(image: UIImage, for key: String) {
        cache.setObject(image, forKey: key as AnyObject)
    }
    
    func imageForKey(key: String) -> UIImage?{
        return cache.object(forKey: key as AnyObject) as? UIImage
    }
    
    func deleteImageForKey(key: String) {
        cache.removeObject(forKey: key as AnyObject)
    }
}
