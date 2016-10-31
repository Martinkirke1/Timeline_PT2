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
    
    static let Shared = PostController()
    
    var posts = [Post]()
    
    
    func createPost(photo: UIImage, caption: String) {
        guard let data = UIImageJPEGRepresentation(photo, 1) else { return }
        
        
        let post = Post(photoData: data)
        posts.append(post)
    }
    
   func addComment(post: Post, text: String, completion: @escaping ((Comment) -> Void) = { _ in }) -> Comment {
    
    let comment = Comment(text: text, post: post)
    post.comments.append(comment)
    
    
        return comment
    }
}
