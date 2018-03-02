//
//  SignupViewController.swift
//  MDB Socials
//
//  Created by Natasha Wong on 2/20/18.
//  Copyright © 2018 Natasha Wong. All rights reserved.
//

import UIKit
import Firebase

class SignupViewController: UIViewController {
    var titleApp: UILabel!
    var emailTextField: UITextField!
    var passwordTextField: UITextField!
    var nameTextField: UITextField!
    var usernameTextField: UITextField!
    var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTitle()
        setupTextFields()
        setupButtons()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    // Setting up MDB Social's title
    func setupTitle() {
        navigationController?.navigationBar.tintColor = UIColor.white;
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.5882, green: 0.8157, blue: 0.9686, alpha: 1.0)
        
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageViewBackground.image = UIImage(named: "clouds")
        
        // you can change the content mode:
        imageViewBackground.contentMode = UIViewContentMode.scaleAspectFill
        imageViewBackground.alpha = 0.5
        
        view.addSubview(imageViewBackground)
        
        titleApp = UILabel(frame: CGRect(x: 0, y: 80, width: view.frame.width, height: 100))
        titleApp.font = UIFont(name: "Strawberry Blossom", size: 80)
        titleApp.backgroundColor = UIColor(red: 0.5882, green: 0.8157, blue: 0.9686, alpha: 1.0)
        titleApp.layer.borderColor = UIColor.white.cgColor
        titleApp.textColor = .white
        titleApp.textAlignment = .center
        titleApp.text = "MDB Socials"
        view.addSubview(titleApp)
        
    }
    
    // Setting up all the textfields required to sign up
    func setupTextFields() {
        usernameTextField = UITextField(frame: CGRect(x: 10, y: 0.5 * UIScreen.main.bounds.height + 60, width: UIScreen.main.bounds.width - 20, height: 40))
        usernameTextField.adjustsFontSizeToFitWidth = true
        usernameTextField.font = UIFont(name: "Strawberry Blossom", size: 30)
        usernameTextField.placeholder = "Username"
        usernameTextField.textAlignment = .center
        usernameTextField.layoutIfNeeded()
        usernameTextField.layer.borderColor = UIColor(red: 0.5882, green: 0.8157, blue: 0.9686, alpha: 1.0).cgColor
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.layer.backgroundColor = UIColor.white.cgColor
        usernameTextField.layer.borderWidth = 1.0
        usernameTextField.layer.masksToBounds = true
        usernameTextField.textColor = UIColor.black
        view.addSubview(usernameTextField)
        
        nameTextField = UITextField(frame: CGRect(x: 10, y: 0.5 * UIScreen.main.bounds.height, width: UIScreen.main.bounds.width - 20, height: 40))
        nameTextField.adjustsFontSizeToFitWidth = true
        nameTextField.font = UIFont(name: "Strawberry Blossom", size: 30)
        nameTextField.placeholder = "Name"
        nameTextField.textAlignment = .center
        nameTextField.borderStyle = .roundedRect
        nameTextField.layer.borderColor = UIColor(red: 0.5882, green: 0.8157, blue: 0.9686, alpha: 1.0).cgColor
        nameTextField.layer.backgroundColor = UIColor.white.cgColor
        nameTextField.layer.borderWidth = 1.0
        nameTextField.layer.masksToBounds = true
        nameTextField.textColor = UIColor.black
        view.addSubview(nameTextField)
        
        emailTextField = UITextField(frame: CGRect(x: 10, y: 0.5 * UIScreen.main.bounds.height + 120, width: UIScreen.main.bounds.width - 20, height: 40))
        emailTextField.adjustsFontSizeToFitWidth = true
        emailTextField.font = UIFont(name: "Strawberry Blossom", size: 30)
        emailTextField.placeholder = "Email"
        emailTextField.textAlignment = .center
        emailTextField.layoutIfNeeded()
        emailTextField.isEnabled = true
        emailTextField.borderStyle = .roundedRect
        emailTextField.layer.borderColor = UIColor(red: 0.5882, green: 0.8157, blue: 0.9686, alpha: 1.0).cgColor
        emailTextField.layer.backgroundColor = UIColor(red: 0.5882, green: 0.8157, blue: 0.9686, alpha: 1.0).cgColor
        emailTextField.layer.borderWidth = 1.0
        emailTextField.layer.masksToBounds = true
        emailTextField.textColor = .black
        view.addSubview(emailTextField)
        
        
        passwordTextField = UITextField(frame: CGRect(x: 10, y: 0.5 * UIScreen.main.bounds.height + 180, width: UIScreen.main.bounds.width - 20, height: 40))
        passwordTextField.adjustsFontSizeToFitWidth = true
        passwordTextField.font = UIFont(name: "Strawberry Blossom", size: 30)
        passwordTextField.placeholder = "Password"
        passwordTextField.textAlignment = .center
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.layer.borderColor = UIColor(red: 0.5882, green: 0.8157, blue: 0.9686, alpha: 1.0).cgColor
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.backgroundColor = UIColor(red: 0.5882, green: 0.8157, blue: 0.9686, alpha: 1.0).cgColor
        passwordTextField.layer.masksToBounds = true
        passwordTextField.textColor = .black
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)
    
    }
    // Setting up buttons such as the sign up button
    func setupButtons() {
        
        signupButton = UIButton(frame: CGRect(x: 10, y: 0.9 * UIScreen.main.bounds.height, width: UIScreen.main.bounds.width - 20, height: 30))
        signupButton.layoutIfNeeded()
        signupButton.titleLabel?.font = UIFont(name: "Strawberry Blossom", size: 30)
        signupButton.setTitle("Sign Up", for: .normal)
        signupButton.setTitleColor(UIColor.white, for: .normal)
        signupButton.setTitleColor(UIColor.white, for: .normal)
        signupButton.layer.borderWidth = 2.0
        signupButton.layer.cornerRadius = 3.0
        signupButton.layer.backgroundColor = UIColor(red: 0.5882, green: 0.8157, blue: 0.9686, alpha: 1.0).cgColor
        signupButton.layer.borderColor = UIColor.white.cgColor
        signupButton.layer.masksToBounds = true
        signupButton.addTarget(self, action: #selector(signupButtonClicked), for: .touchUpInside)
        view.addSubview(signupButton)
    
    }
    
    /* Segues to the feed view controller if the sign up button is clicked, also checks for require
     * fields
     */
    @objc func signupButtonClicked() {
        //TODO: Implement this method with Firebase!
        let email = emailTextField.text!
        let password = passwordTextField.text!
        let name = nameTextField.text!
        let username = usernameTextField.text!
        
        if email == "" || password == "" || username == "" || name  == "" {
            let alert = UIAlertController(title: "Not all information inputted", message: "Please fill out all fields", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        if password.count < 6 {
            let alert = UIAlertController(title: "Not long enough password", message: "Password must be at least 6 characters", preferredStyle: UIAlertControllerStyle.alert)
            self.present(alert, animated: true, completion: nil)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                switch action.style{
                case.default:
                    print("default")
                case.cancel:
                    print("cancel")
                case.destructive:
                    print("destructive")
                }
            }))
        }
    
        UserAuthHelper.createUser(email: email, password: password, withBlock: { (id) in FirebaseSocialAPIClient.createNewUser(id: id, name: name, email: email, username: username)
            self.emailTextField.text = ""
            self.passwordTextField.text = ""
            self.nameTextField.text = ""
            self.usernameTextField.text = ""
            self.performSegue(withIdentifier: "toFeedFromSignup", sender: self)
        })
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
