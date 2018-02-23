//
//  NewSocialViewController.swift
//  MDB Socials
//
//  Created by Natasha Wong on 2/20/18.
//  Copyright © 2018 Natasha Wong. All rights reserved.
//

import UIKit
import Firebase

class NewPostViewController: UIViewController {
    var nameEvent: UITextField!
    var descriptionTextField: UITextField!
    var nameEventTextField: UITextField!
    var usernameTextField: UITextField!
    var newPostButton: UIButton!
    var imagePost: UIImageView!
    var selectFromLibraryButton: UIButton!
    var selectFromCameraButton: UIButton!
    let picker = UIImagePickerController()
    var date: String!
    
   // var chosenImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        setupButtons()
        setupTextFields()
        setupEventImageView()
     //   setupCalendar()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    func setupTextFields() {
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageViewBackground.image = UIImage(named: "clouds")
        // you can change the content mode:
        imageViewBackground.contentMode = UIViewContentMode.scaleAspectFill
        imageViewBackground.alpha = 0.5
        
        view.addSubview(imageViewBackground)
        nameEventTextField = UITextField(frame: CGRect(x: 10, y: 0.6 * UIScreen.main.bounds.height, width: UIScreen.main.bounds.width - 20, height: 40))
        nameEventTextField.adjustsFontSizeToFitWidth = true
        nameEventTextField.font = UIFont(name: "Strawberry Blossom", size: 30)
        nameEventTextField.placeholder = "Event Name"
        nameEventTextField.textAlignment = .center
        nameEventTextField.layoutIfNeeded()
        nameEventTextField.layer.borderColor = UIColor(red: 0.5882, green: 0.8157, blue: 0.9686, alpha: 1.0).cgColor
        nameEventTextField.borderStyle = .roundedRect
        nameEventTextField.layer.backgroundColor = UIColor.white.cgColor
        nameEventTextField.layer.borderWidth = 1.0
        nameEventTextField.layer.masksToBounds = true
        nameEventTextField.textColor = UIColor.black
        view.addSubview(nameEventTextField)
        
        descriptionTextField = UITextField(frame: CGRect(x: 10, y: 0.6 * UIScreen.main.bounds.height+60, width: UIScreen.main.bounds.width - 20, height: 60))
        descriptionTextField.adjustsFontSizeToFitWidth = true
        descriptionTextField.font = UIFont(name: "Strawberry Blossom", size: 30)
        descriptionTextField.placeholder = "Short Description of the Event"
        descriptionTextField.textAlignment = .center
        descriptionTextField.borderStyle = .roundedRect
        descriptionTextField.layer.borderColor = UIColor(red: 0.5882, green: 0.8157, blue: 0.9686, alpha: 1.0).cgColor
        descriptionTextField.layer.backgroundColor = UIColor.white.cgColor
        descriptionTextField.layer.borderWidth = 1.0
        descriptionTextField.layer.masksToBounds = true
        descriptionTextField.textColor = UIColor.black
        view.addSubview(descriptionTextField)
        
        
    }
    func setupEventImageView() {
        imagePost = UIImageView(frame: CGRect(x: 30, y: 50, width: view.frame.width - 60, height: 60))
        imagePost.layer.cornerRadius = 5.0
        imagePost.contentMode = .scaleToFill
        imagePost.clipsToBounds = true
        
        selectFromLibraryButton = UIButton(frame: CGRect(x: 50, y: 300, width: UIScreen.main.bounds.width * 0.3, height: 40))
        selectFromLibraryButton.titleLabel?.font = UIFont(name: "Strawberry Blossom", size: 35)
        selectFromLibraryButton.setTitle("Library", for: .normal)
        selectFromLibraryButton.layer.borderColor =  UIColor(red: 0.5882, green: 0.8157, blue: 0.9686, alpha: 1.0).cgColor
        selectFromLibraryButton.layer.borderWidth = 1
        selectFromLibraryButton.layer.backgroundColor = UIColor.white.cgColor
        selectFromLibraryButton.setTitleColor(UIColor(red: 0.5882, green: 0.8157, blue: 0.9686, alpha: 1.0), for: .normal)
        selectFromLibraryButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
        
//        view.bringSubview(toFront: selectFromLibraryButton)
        
        selectFromCameraButton = UIButton(frame: CGRect(x: 200, y: 300, width: UIScreen.main.bounds.width * 0.3, height: 40))
        selectFromCameraButton.titleLabel?.font = UIFont(name: "Strawberry Blossom", size: 35)
        selectFromCameraButton.setTitle("Camera", for: .normal)
        selectFromCameraButton.layer.borderColor =  UIColor(red: 0.5882, green: 0.8157, blue: 0.9686, alpha: 1.0).cgColor
        selectFromCameraButton.layer.borderWidth = 1
        selectFromCameraButton.layer.backgroundColor = UIColor.white.cgColor
        selectFromCameraButton.setTitleColor(UIColor(red: 0.5882, green: 0.8157, blue: 0.9686, alpha: 1.0), for: .normal)
        selectFromCameraButton.addTarget(self, action: #selector(takeImage), for: .touchUpInside)
       
        view.addSubview(selectFromCameraButton)
        view.addSubview(selectFromLibraryButton)
        view.addSubview(imagePost)
        
    }
    
    @objc func pickImage(sender: UIButton!) {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
    }
    @objc func takeImage(sender: UIButton!) {
        picker.allowsEditing = false
        picker.sourceType = .camera
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)!
        present(picker, animated: true, completion: nil)
    }
    
    func setupButtons() {
        newPostButton = UIButton(frame: CGRect(x: 10, y: 0.9 * UIScreen.main.bounds.height, width: UIScreen.main.bounds.width - 20, height: 30))
        newPostButton.layoutIfNeeded()
        newPostButton.titleLabel?.font = UIFont(name: "Strawberry Blossom", size: 35)
        newPostButton.setTitle("Create New Post", for: .normal)
        newPostButton.setTitleColor(.white, for: .normal)
        newPostButton.layer.borderWidth = 2.0
        newPostButton.layer.cornerRadius = 5.0
        newPostButton.layer.backgroundColor = UIColor(red: 0.5882, green: 0.8157, blue: 0.9686, alpha: 1.0).cgColor
        newPostButton.setTitleColor(.white, for: .normal)
        newPostButton.layer.borderColor = UIColor.white.cgColor
        newPostButton.layer.masksToBounds = true
        newPostButton.addTarget(self, action: #selector(addNewPost), for: .touchUpInside)
        view.addSubview(newPostButton)
        
        let datePickerView = UIDatePicker()
        datePickerView.date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd h:mm a"
        var dateAsString = dateFormatter.string(from: datePickerView.date)
        print(dateAsString)
        dateFormatter.dateFormat = "MMM-yy-dd HH:mm"
        dateAsString = dateFormatter.string(from: datePickerView.date)
        print(dateAsString)
        view.addSubview(datePickerView)
    }
    func setupCalendar() {
        let datePicker: UIDatePicker = UIDatePicker()
        
        // Posiiton date picket within a view
        datePicker.frame = CGRect(x: 10, y: 50, width: self.view.frame.width, height: 200)
        
        // Set some of UIDatePicker properties
        datePicker.timeZone = NSTimeZone.local
        datePicker.backgroundColor = UIColor.white
        
        // Add an event to call onDidChangeDate function when value is changed.
        datePicker.addTarget(self, action: #selector(NewPostViewController.datePickerValueChanged(_:)), for: .valueChanged)
        
        // Add DataPicker to the view
        self.view.addSubview(datePicker)
    }
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
        // Create date formatter
        let dateFormatter: DateFormatter = DateFormatter()
        // Set date format
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm a"
        // Apply date format
        let selectedDate: String = dateFormatter.string(from: sender.date)
        date = selectedDate
        
        print("Selected value \(selectedDate)")
    }

    @objc func addNewPost() {
        let currentUser = Auth.auth().currentUser
        let imageData = UIImageJPEGRepresentation(imagePost.image!, 0.9)
        let description = descriptionTextField.text!
        let name = nameEventTextField.text!
        let date = self.date
        
        //TODO: Implement using Firebase!
        FirebaseSocialAPIClient.createNewPost(name: name, description: description, date: date!, imageData: imageData!, host: (currentUser?.displayName)!, hostId: (currentUser?.uid)!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NewPostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //MARK: - Delegates
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        selectFromLibraryButton.removeFromSuperview()
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imagePost.contentMode = .scaleAspectFit
        imagePost.image = chosenImage
        dismiss(animated:true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
