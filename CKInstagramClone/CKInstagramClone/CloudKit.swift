//
//  CloudKit.swift
//  CKInstagramClone
//
//  Created by Erica Winberry on 3/28/17.
//  Copyright © 2017 Erica Winberry. All rights reserved.
//

import Foundation
import CloudKit

typealias PostCompletion = (Bool) -> ()

class CloudKit {
    
    static let shared = CloudKit()
    
    let container = CKContainer.default()
    var privateDatabase: CKDatabase {
        return self.container.privateCloudDatabase
    }
    
    func save(post: Post, completion: @escaping PostCompletion) {
        do {
            if let record = try Post.recordFor(post: post) {
                
                privateDatabase.save(record, completionHandler: { (record, error) in
                    if error != nil {
                        completion(false)
                    }
                    
                    if let record = record {
                        print(record)
                        completion(true)
                    } else {
                        completion(false)
                    }
                })
            }
        } catch {
            print(error)
        }
    }
}
