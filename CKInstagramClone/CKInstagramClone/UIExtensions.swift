//
//  UIExtensions.swift
//  CKInstagramClone
//
//  Created by Erica Winberry on 3/29/17.
//  Copyright © 2017 Erica Winberry. All rights reserved.
//

import UIKit

extension UIImage {

    func resize(size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContext(size)
        
        self.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return resizedImage
    }
    
    var path: URL {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
            else {
            fatalError("Error getting documents directory.")
        }
        
        return documentsDirectory.appendingPathComponent("image")
    }
    
}
