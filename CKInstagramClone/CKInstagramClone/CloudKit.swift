//
//  CloudKit.swift
//  CKInstagramClone
//
//  Created by Erica Winberry on 3/28/17.
//  Copyright © 2017 Erica Winberry. All rights reserved.
//

import Foundation
import CloudKit

class CloudKit {
    
    static let shared = CloudKit()
    
    let container = CKContainer.default()
    var database: CKDatabase {
        return self.container.privateCloudDatabase
    }
    
    //Will continue building out methods here.
}
