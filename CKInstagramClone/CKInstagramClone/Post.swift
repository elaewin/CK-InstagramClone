//
//  Post.swift
//  CKInstagramClone
//
//  Created by Erica Winberry on 3/29/17.
//  Copyright © 2017 Erica Winberry. All rights reserved.
//

import UIKit
import CloudKit

enum PostError: Error {
    case writingImageToData
    case writingDataToDisk
}

class Post {
    
    let image: UIImage
    
    init(image: UIImage) {
        self.image = image
    }
    
}

extension Post {
    
    class func recordFor(post: Post) throws -> CKRecord? {
        
        guard let data = UIImageJPEGRepresentation(post.image, 0.7) else { throw PostError.writingImageToData }
            
            do {
                try data.write(to: post.image.path)
                
                let asset = CKAsset(fileURL: post.image.path)
                
                let record = CKRecord(recordType: "Post")
                record.setValue(asset, forKey: "image")
                
                return record
                
                
            } catch {
                throw PostError.writingDataToDisk
                
            }
    }
    
}






