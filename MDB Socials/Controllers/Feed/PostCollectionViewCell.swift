//
//  PostCollectionViewCell.swift
//  MDB Socials
//
//  Created by Natasha Wong on 2/21/18.
//  Copyright © 2018 Natasha Wong. All rights reserved.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    var profileImage: UIImageView!
    var posterText: UILabel!
    var postText: UITextView!
    var interestedButton: UIButton!
    var numberInterested: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
        self.backgroundColor = UIColor(red: 0.5882, green: 0.8157, blue: 0.9686, alpha: 1.0)
        setupProfileImage()
        setupPosterText()
        setupPostText()
        setupInterested()
    }
    func setupInterested() {
        let origImage = UIImage(named: "heartIcon")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        interestedButton = UIButton(frame: CGRect(x: self.contentView.frame.width - 50, y: self.contentView.frame.height - 40, width: 30, height: 30))
        interestedButton.setImage(tintedImage, for: .normal)
        interestedButton.tintColor = UIColor.white
        addSubview(interestedButton)
    }
    
    func setupProfileImage() {
        profileImage = UIImageView(frame: CGRect(x: 10, y: 10, width: 0.50 * self.contentView.frame.width, height: 0.70 * self.contentView.frame.height))
        profileImage.layer.backgroundColor = UIColor.white.cgColor
        profileImage.clipsToBounds = true
        profileImage.contentMode = .scaleAspectFit
        addSubview(profileImage)
    }
    
    func setupPosterText() {
        posterText = UILabel(frame: CGRect(x: profileImage.frame.maxX + 10, y: 10, width: self.contentView.frame.width * 0.5 - 30, height: 50))
        posterText.layer.backgroundColor = UIColor.white.cgColor
        posterText.textColor = UIColor.black
        posterText.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight(rawValue: 2))
        posterText.adjustsFontForContentSizeCategory = true
        addSubview(posterText)
    }
    
    func setupPostText() {
        postText = UITextView(frame: CGRect(x: profileImage.frame.maxX + 10, y: posterText.frame.maxY + 10, width: self.contentView.frame.width * 0.5 - 30, height: 0.5 * self.frame.height - 20))
        postText.layer.backgroundColor = UIColor.white.cgColor
        postText.textColor = UIColor.black
        postText.adjustsFontForContentSizeCategory = true
        postText.isEditable = false
        addSubview(postText)
    }
    
}
