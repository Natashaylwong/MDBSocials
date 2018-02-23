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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
        self.backgroundColor = UIColor.white
        setupProfileImage()
        setupPosterText()
        setupPostText()
    }
    
    func setupProfileImage() {
        profileImage = UIImageView(frame: CGRect(x: 10, y: 10, width: 0.50 * self.frame.height, height: 0.50 * self.frame.height))
        profileImage.clipsToBounds = true
        profileImage.contentMode = .scaleAspectFit
        addSubview(profileImage)
    }
    
    func setupPosterText() {
        posterText = UILabel(frame: CGRect(x: profileImage.frame.maxX + 10, y: 10, width: self.frame.width, height: 30))
        posterText.textColor = UIColor.black
        posterText.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight(rawValue: 2))
        posterText.adjustsFontForContentSizeCategory = true
        addSubview(posterText)
    }
    
    func setupPostText() {
        postText = UITextView(frame: CGRect(x: profileImage.frame.maxX + 10, y: posterText.frame.maxY + 10, width: self.frame.width, height: 0.5 * self.frame.height - 40))
        postText.textColor = UIColor.black
        postText.adjustsFontForContentSizeCategory = true
        postText.isEditable = false
        addSubview(postText)
    }
    
}
