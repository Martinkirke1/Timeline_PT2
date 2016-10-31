//
//  Post.swift
//  Timeline_PT2
//
//  Created by Martin Kirke on 10/31/16.
//  Copyright © 2016 Ghost. All rights reserved.
//

import Foundation
import UIKit

class Post {
    
    var photoData: Data?
    var timestamp: Date
    var comments: [Comment]
    var photo: UIImage? {
        guard let photoData = self.photoData else { return nil }
        return UIImage(data: photoData)
    }
    
    init(photoData: Data, timestamp: Date = Date(), comments: [Comment] = []){
        self.photoData = photoData
        self.timestamp = timestamp
        self.comments = comments
    }
    
    
}
