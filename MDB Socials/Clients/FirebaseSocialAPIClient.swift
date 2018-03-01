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
    static func fetchPosts(withBlock: @escaping ([Post]) -> ()) {
        //TODO: Implement a method to fetch posts with Firebase!
        let ref = Database.database().reference()
        ref.child("Posts").observe(.childAdded, with: { (snapshot) in
            let post = Post(id: snapshot.key, postDict: snapshot.value as! [String : Any]?)
            withBlock([post])
        })
    }
    
    static func fetchUser(id: String, withBlock: @escaping (Users) -> ()) {
        //TODO: Implement a method to fetch posts with Firebase!
        let ref = Database.database().reference()
        ref.child("Users").child(id).observeSingleEvent(of: .value, with: { (snapshot) in
            let user = Users(id: snapshot.key, userDict: snapshot.value as! [String : Any]?)
            withBlock(user)
            
        })
    }
    
    static func createNewPost(name: String, description: String, date: String, imageData: Data, host: String, hostId: String) {
        let postsRef = Database.database().reference().child("Posts")
        let key = postsRef.childByAutoId().key
        let storage = Storage.storage().reference().child("Event Images/\(key)")
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        print("storing")
        storage.putData(imageData, metadata: metadata).observe(.success) {(snapshot) in print("image stored")
            let imageURL = snapshot.metadata?.downloadURL()?.absoluteString as! String
            let interested = [hostId]
            let newPost = ["name": name, "description": description, "date": date, "imageURL": imageURL, "host": host, "hostId": hostId] as [String: Any]
            let childUpdates = ["\(key)": newPost]
            postsRef.updateChildValues(childUpdates)
        }
    }
    static func createNewUser(id: String, name: String, email: String, username: String) {
        let usersRef = Database.database().reference().child("Users")
        let newUser = ["name": name, "email": email, "username": username]
        let childUpdates = ["/\(id)/": newUser]
        usersRef.updateChildValues(childUpdates)
    }
}

