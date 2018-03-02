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
    static func createNewPost(name: String, description: String, date: String, imageData: Data, host: String, hostId: String, interested: [String]) {
        let postsRef = Database.database().reference().child("Posts")
        let key = postsRef.childByAutoId().key
        let storage = Storage.storage().reference().child("Event Images/\(key)")
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        storage.putData(imageData, metadata: metadata).observe(.success) {(snapshot) in print("image stored")
            let imageURL = snapshot.metadata?.downloadURL()?.absoluteString as! String
            var interested = [hostId]
            interested.append(hostId)
            let newPost = ["name": name, "description": description, "date": date, "imageURL": imageURL, "host": host, "hostId": hostId, "postId": key, "interested": interested] as [String: Any]
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
}

