//
//  FirebaseSocialAPIClient.swift
//  MDB Socials
//
//  Created by Natasha Wong on 2/21/18.
//  Copyright © 2018 Natasha Wong. All rights reserved.
//

import Foundation
import Firebase

class FirebaseSocialAPIClient {
    // Retrieving data from Firebase for a post
    static func fetchPosts(withBlock: @escaping ([Post]) -> ()) {
        //TODO: Implement a method to fetch posts with Firebase!
        let ref = Database.database().reference()
        ref.child("Posts").observe(.childAdded, with: { (snapshot) in
            let post = Post(id: snapshot.key, postDict: snapshot.value as! [String : Any]?)
            withBlock([post])
        })
    }
    // Retrieving data from Firebase for a user
    static func fetchUser(id: String, withBlock: @escaping (Users) -> ()) {
        //TODO: Implement a method to fetch posts with Firebase!
        let ref = Database.database().reference()
        ref.child("Users").child(id).observeSingleEvent(of: .value, with: { (snapshot) in
            let user = Users(id: snapshot.key, userDict: snapshot.value as! [String : Any]?)
            withBlock(user)
            
        })
    }
    // Creating a new post and saving it into Firebase
    static func createNewPost(name: String, description: String, date: String, imageData: Data, host: String, hostId: String, interested: Int) {
        let postsRef = Database.database().reference().child("Posts")
        let key = postsRef.childByAutoId().key
        let storage = Storage.storage().reference().child("Event Images/\(key)")
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        storage.putData(imageData, metadata: metadata).observe(.success) {(snapshot) in print("image stored")
            let imageURL = snapshot.metadata?.downloadURL()?.absoluteString as! String
            let newPost = ["name": name, "description": description, "date": date, "imageURL": imageURL, "host": host, "hostId": hostId, "postId": key, "interest": 0] as [String: Any]
            let childUpdates = ["\(key)": newPost]
            postsRef.updateChildValues(childUpdates)
        }
    }
    // Creating a new user and updating the user node in Firebase
    static func createNewUser(id: String, name: String, email: String, username: String) {
        let usersRef = Database.database().reference().child("Users")
        let newUser = ["name": name, "email": email, "username": username]
        let childUpdates = ["/\(id)/": newUser]
        usersRef.updateChildValues(childUpdates)
    }
    
//    static func createNewInterested(userID: String, postID: String){
//        let ref = Database.database().reference()
//        let key = ref.child("Interested").childByAutoId().key
//        ref.child("Interested").setValue([postID : [userID : ""]])
//    }
//
//    static func fetchInterested(postID: String, withBlock: @escaping (String) -> ()) {
//        let ref = Database.database().reference().child("Interested")
//        ref.child(postID).observe(.childAdded, with: { (snapshot) in
//            withBlock(snapshot.key)
//        })
//    }
//
//    static func fetchRSVP(postID: String, withBlock: @escaping (Int) -> ()) {
//        let ref = Database.database().reference()
//        ref.child("Posts").child(postID).observe(.childChanged, with: { (snapshot) in
//            withBlock(snapshot.value as! Int)
//        })
//    }
//
//    static func eventRSVP(postID: String, userID: String) {
//        let ref = Database.database().reference()
//        ref.child("Posts").child(postID).runTransactionBlock({ (currentData:MutableData) -> TransactionResult in
//            if var post = currentData.value as? [String: AnyObject] {
//                var rsvpCount = post["interestCount"] as? Int ?? 0
//                rsvpCount += 1
//                post["interestCount"] = rsvpCount as AnyObject?
//                currentData.value = post
//                return TransactionResult.success(withValue: currentData)
//            }
//            return TransactionResult.abort()
//        })
//        ref.child("Interested").child(postID).setValue([userID : ""])
//    }

    
    
}

