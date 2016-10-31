//
//  PostController.swift
//  Timeline_PT2
//
//  Created by Martin Kirke on 10/31/16.
//  Copyright © 2016 Ghost. All rights reserved.
//

import Foundation
import UIKit

class PostController {
    
    static let shared = PostController()
    
    var posts: [Post] = []
    
    
    func createPost(photo: UIImage, caption: String) {
        guard let data = UIImageJPEGRepresentation(photo, 1) else { return }
        
        let post = Post(photoData: data)
        let comment = Comment(text: caption, post: post)
        posts.append(post)
        post.comments.append(comment)
    }
    
    func addComment( post: Post, commentText: String) {
    
    let comment = Comment(text: commentText, post: post)
    post.comments.append(comment)
    }
}
