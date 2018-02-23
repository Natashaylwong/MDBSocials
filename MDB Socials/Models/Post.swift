//
//  Post.swift
//  MDB Socials
//
//  Created by Natasha Wong on 2/21/18.
//  Copyright © 2018 Natasha Wong. All rights reserved.
//

import Foundation
import UIKit
import Firebase


class Post {
    var text: String?
    var imageUrl: String?
    var posterId: String?
    var eventName: String?
    var interested: String?
    var poster: String?
    var id: String?
    var image: UIImage?
    
    
    init(id: String, postDict: [String:Any]?) {
        self.id = id
        if postDict != nil {
            if let text = postDict!["text"] as? String {
                self.text = text
            }
            if let imageUrl = postDict!["imageUrl"] as? String {
                self.imageUrl = imageUrl
            }
            if let posterId = postDict!["posterId"] as? String {
                self.posterId = posterId
            }
            if let poster = postDict!["poster"] as? String {
                self.poster = poster
            }
        }
    }
    

    func getEventPic(withBlock: @escaping () -> ()) {
        //TODO: Get Picture from Storage
        let postsRef = Database.database().reference().child("Posts")
        let key = postsRef.childByAutoId().key
//        let storage = Storage.storage().reference().child("Event Images/\(key)")
        let ref = Storage.storage().reference().child("Event Images\(key)")
        ref.getData(maxSize: 1 * 2048 * 2048) { data, error in
            if let error = error {
                print(error)
            } else {
                self.image = UIImage(data: data!)
                withBlock()
            }
        }
    }
}

