//
//  Comment.swift
//  Timeline_PT2
//
//  Created by Martin Kirke on 10/31/16.
//  Copyright © 2016 Ghost. All rights reserved.
//

import Foundation

class Comment {
 
    var text: String
    var timestamp: Date
    var post: Post?
    
    
    init(text: String, timestamp: Date = Date(), post: Post){
        self.text = text
        self.timestamp = timestamp
        self.post = post
    }
    
}
