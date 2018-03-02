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
    var interestCount: Int?
    var poster: String?
    var id: String?
    var image: UIImage?
    
    
    init(id: String, postDict: [String:Any]?) {
        self.id = id
        if postDict != nil {
            if let id = postDict!["postId"] as? String {
                self.id = id
            }
            if let text = postDict!["description"] as? String {
                self.text = text
            }
            if let imageUrl = postDict!["imageUrl"] as? String {
                self.imageUrl = imageUrl
            }
            if let posterId = postDict!["hostId"] as? String {
                self.posterId = posterId
            }
            if let poster = postDict!["host"] as? String {
                self.poster = poster
            }
            if let eventName = postDict!["name"] as? String {
                self.eventName = eventName
            }
            if let interestCount = postDict!["interestCount"] as? Int {
                self.interestCount = interestCount
            }
        }
    }
    

    func getEventPic(withBlock: @escaping () -> ()) {
        //TODO: Get Picture from Storage
//        let postsRef = Database.database().reference().child("Posts")
        let ref = Storage.storage().reference().child("Event Images/\(id!)")
        ref.getData(maxSize: 5 * 2048 * 2048) { data, error in
            if let error = error {
                print(error)
            } else {
                self.image = UIImage(data: data!)
                withBlock()
            }
        }
    }
}

