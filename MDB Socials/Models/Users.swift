//
//  User.swift
//  MDB Socials
//
//  Created by Natasha Wong on 2/21/18.
//  Copyright © 2018 Natasha Wong. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class Users: Mappable {
    var name: String?
    var email: String?
    var username: String?
    var password: String?
    var id: String?
    
//    init(id: String, userDict: [String:Any]?) {
//        self.id = id
//        if userDict != nil {
//            if let name = userDict!["name"] as? String {
//                self.name = name
//            }
//            if let username = userDict!["username"] as? String {
//                self.username = username
//            }
//            if let email = userDict!["email"] as? String {
//                self.email = email
//            }
//            if let password = userDict!["password"] as? String {
//                self.password = password
//            }
//
//        }
//    }
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        name                            <- map["name"]
        email                           <- map["email"]
        username                        <- map["username"]
        password                        <- map["password"]
        id                         <- map["id"]
    }
    
    static func getCurrentUser(withId: String, block: @escaping (Users) -> ()) {
        FirebaseSocialAPIClient.fetchUser(id: withId, withBlock: {(user) in
            block(user)
        })
    }
    
    
}
