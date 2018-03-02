//
//  DetailViewController.swift
//  MDB Socials
//
//  Created by Natasha Wong on 2/20/18.
//  Copyright © 2018 Natasha Wong. All rights reserved.
//

import UIKit
import Firebase

class DetailViewController: UIViewController {
    var currentUser: Users?
    var post: Post?
    var poster: String?
    var eventName: String?
    var descrip: String?
    var eventImage: UIImage?
    var exitButton: UIButton!
    var posterId: String?
    var interested: [String]!
    var interestedLabel: UILabel!
    var posterLabel: UILabel!
    var eventNameLabel: UILabel!
    var eventImageView: UIImageView!
    var descriptionLabel: UILabel!
    var interestedButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupExit()
        setupLabels()
        setupInterested()
        setupImageView()
        
        Users.getCurrentUser(withId: (Auth.auth().currentUser?.uid)!, block: {(cUser) in
            self.currentUser = cUser
        })    }
    let mainColor = UIColor(red: 0.5882, green: 0.8157, blue: 0.9686, alpha: 1.0)
    
    func setupImageView() {
        eventImageView = UIImageView(frame: CGRect(x: 0, y: 220, width: view.frame.width, height: 250))
        eventImageView.backgroundColor = mainColor
        eventImageView.layer.borderColor = UIColor.black.cgColor
        eventImageView.layer.borderWidth = 2
        eventImageView.alpha = 0.9
        eventImageView.image = eventImage
        view.addSubview(eventImageView)
    }
    func setupExit() {
        exitButton = UIButton(frame: CGRect(x: 310, y: 20, width: 30, height: 30))
        exitButton.setImage(UIImage(named: "exit"), for: .normal)
        exitButton.addTarget(self, action: #selector(exitScreen), for: .touchUpInside)
        view.addSubview(exitButton)
    }
    @objc func exitScreen(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    func setupLabels() {
        view.backgroundColor = UIColor(patternImage: UIImage(named: "image")!)

        posterLabel = UILabel(frame: CGRect(x: 0, y: 140, width: view.frame.width, height: 50))
        posterLabel.text = "Host: " + poster!
        posterLabel.textAlignment = .center
        posterLabel.font = UIFont(name: "Strawberry Blossom", size: 40)
        view.addSubview(posterLabel)
        
        eventNameLabel = UILabel(frame: CGRect(x: 0, y: 60, width: view.frame.width, height: 80))
        eventNameLabel.layer.borderColor = UIColor.black.cgColor
        eventNameLabel.layer.borderWidth = 2
        eventNameLabel.backgroundColor = UIColor.white
        eventNameLabel.text = eventName
        eventNameLabel.textAlignment = .center
        eventNameLabel.numberOfLines = 0
        eventNameLabel.adjustsFontSizeToFitWidth = true
        eventNameLabel.font = UIFont(name: "Strawberry Blossom", size: 80)
        view.addSubview(eventNameLabel)
        
        descriptionLabel = UILabel(frame: CGRect(x: 0, y: 500, width: view.frame.width, height: 90))
        descriptionLabel.layer.borderColor = UIColor.black.cgColor
        descriptionLabel.layer.borderWidth = 2
        descriptionLabel.text = "Description: " + descrip!
        descriptionLabel.backgroundColor = UIColor.white
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = UIFont(name: "Strawberry Blossom", size: 30)
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.numberOfLines = 0
        view.addSubview(descriptionLabel)
        
        interestedLabel = UILabel(frame: CGRect(x: view.frame.width - 110, y: view.frame.height - 60, width: 50, height: 50))
        if interested == nil {
            interestedLabel.text = "\(0)"
            interestedLabel.font = UIFont(name: "Strawberry Blossom", size: 20)

        } else {
            interestedLabel.text = "\(interested.count)"
            interestedLabel.font = UIFont(name: "Strawberry Blossom", size: 20)
        }
        view.addSubview(interestedLabel)
    }
    
    func setupInterested() {
        let origImage = UIImage(named: "heartIcon")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        interestedButton = UIButton(frame: CGRect(x: view.frame.width - 70, y: view.frame.height - 60, width: 50, height: 50))
        interestedButton.setImage(tintedImage, for: .normal)
        interestedButton.tintColor = UIColor.black
        
//        if interestedNum.contains(currentUser?.id)) {
//            interestedButton.tintColor = mainColor
//        } else {
//            interestedButton.tintColor = UIColor.black
//        }
        interestedButton.addTarget(self, action: #selector(interestPressed), for: .touchUpInside)
        view.addSubview(interestedButton)
    }
    
    @objc func interestPressed() {
        if interested.contains((currentUser?.id)!) {
            interestedButton.tintColor = UIColor.black
            let index = interested.index(of: (currentUser?.id)!)
            interested.remove(at: index!)
            print("\(interested)")
            interestedButton.tintColor = UIColor.black
            interestedLabel.text = "\(interested.count)"
            let postsRef = Database.database().reference().child("Posts").child((post?.id)!)
            let childUpdates = ["interested": interested]
            postsRef.updateChildValues(childUpdates)
        } else {
            interestedButton.tintColor = UIColor.red
            interested.append((currentUser?.id)!)
            print("\(interested)")
            interestedButton.tintColor = mainColor
            interestedLabel.text = "\(interested.count)"
            let postsRef = Database.database().reference().child("Posts").child((post?.id)!)
            let childUpdates = ["interested": interested]
            postsRef.updateChildValues(childUpdates)
        }
        
//        if fav == false {
//            interestedButton.tintColor = mainColor
//            fav = true
//        } else {
//            interestedButton.tintColor = UIColor.black
//            fav = false
//        }
    }
    

}
