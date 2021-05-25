// Group no. : 10
// Members:
//    - Maitri Modi (101318200)
//    - Jainam Shah (101277989)

//  ViewController.swift
//  carpa
//
//  Created by MacBook Pro on 13/05/21.
//  Copyright © 2021 carpark. All rights reserved.
//

import UIKit

class SignInController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordError: UILabel!
    private let userProfileRepo:UserProfileRepo = UserProfileRepo()
    
    private let appStore:AppStore = AppStore()
    
    override func viewDidLoad() {
        setupLabel()
        checkUserLoggedIn()
        super.viewDidLoad()
        
    }
    
    @IBAction func emailEditingBegin(_ sender: Any) {
        emailError.isHidden=true
        emailTextField.layer.borderWidth=0
        emailTextField.layer.borderColor = UIColor.black.cgColor
        
    }
    @IBAction func passwordEditingBegin(_ sender: Any) {
        passwordError.isHidden=true
        passwordTextField.layer.borderWidth=0
        passwordTextField.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func signIn(_ sender: UIButton) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        guard !email.isEmpty else {
            emailError.isHidden = false
            emailError.text="Email is empty!"
            emailError.textColor = .red
            emailTextField.layer.borderWidth=1
            emailTextField.layer.borderColor = UIColor.red.cgColor
            return
        }
        guard email.isValidEmail() else{
            emailError.isHidden = false
            emailError.text="Email isnt valid!"
            emailError.textColor = .red
            emailTextField.layer.borderWidth=1
            emailTextField.layer.borderColor = UIColor.red.cgColor
            return
        }
        
        guard !password.isEmpty else {
            passwordError.isHidden = false
            passwordError.text="password is empty!"
            passwordError.textColor = .red
            passwordTextField.layer.borderWidth=1
            passwordTextField.layer.borderColor = UIColor.red.cgColor
            return
        }
        let userData = userProfileRepo.checkUserExist(byEmail: email)
        
        if let data = userData{
            
            appStore.saveUserEmail(email: data.email)
            appStore.saveCarPlateNo(carPlateNo: data.carPlateNumber)
            appStore.saveUserId(currentUserId: data.userId.uuidString)
            appStore.setUserLoggedIn(isUserLoggedIn: true)
            self.showToast(message: "User has successfully Signed in", font: .systemFont(ofSize: 12.0))
            checkUserLoggedIn()

        }
        else{
            self.showToast(message: "Unable to find user with this email id", font: .systemFont(ofSize: 12.0))

        }
        
    }
    private func setupLabel(){
        emailError.text=""
        passwordError.text=""
    }
    
    
    @IBAction func signUp(_ sender: UIButton) {
        let SignUpController = self.storyboard?.instantiateViewController(identifier: "SignUpScreen") as! SignUpController
        
        self.navigationController?.pushViewController(SignUpController, animated: true)
    }
    
    private func checkUserLoggedIn(){
        let currentUser = appStore.isUserLoggedIn()
        print(currentUser)
        if currentUser{
            let parkingViewController = self.storyboard?.instantiateViewController(identifier: "parking_list") as! ParkingTableViewController
                   
                   self.navigationController?.pushViewController(parkingViewController, animated: true)
        }
    }
}

