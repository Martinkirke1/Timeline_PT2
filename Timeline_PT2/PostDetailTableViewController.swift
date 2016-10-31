//
//  PostDetailTableViewController.swift
//  Timeline_PT2
//
//  Created by Martin Kirke on 10/31/16.
//  Copyright © 2016 Ghost. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {
    @IBAction func shareButtonTapped(_ sender: Any) {
    }
    @IBAction func followPostButtonTapped(_ sender: Any) {
    }
    @IBOutlet weak var detailIamge: UIImageView!

    
    
    @IBAction func addCommentTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Add Comment", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            
            textField.placeholder = "Test"
        }
        
        let addComment = UIAlertAction(title: "Add Comment", style: .default) { (action) in
            
            guard let commentText = alert.textFields?.first?.text,
                let post = self.post else { return }
            
            PostController.shared.addComment(post: post, commentText: commentText)
            self.updateView()
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alert.addAction(addComment)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    var post: Post?

    
    private func updateView() {
        guard let post = post, isViewLoaded else { return }
        
        detailIamge.image = post.photo
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return post?.comments.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)

        guard let post = post else { return cell }
        let comment = post.comments[indexPath.row]
        cell.textLabel?.text = comment.text
//       cell.detailTextLabel?.text = comment.cloudKitRecordID?.recordName

        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
