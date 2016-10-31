//
//  PostTableViewCell.swift
//  Timeline_PT2
//
//  Created by Martin Kirke on 10/31/16.
//  Copyright © 2016 Ghost. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func updateWithPost() {
        postImageView.image = post?.photo
    }
   
    var post: Post? {
        didSet {
            updateWithPost()
        }
    }
}
