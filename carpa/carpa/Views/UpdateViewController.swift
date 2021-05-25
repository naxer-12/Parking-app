// Group no. : 10
// Members:
//    - Maitri Modi (101318200)
//    - Jainam Shah (101277989)

//  UpdateViewController.swift
//  carpa
//
//  Created by MacBook Pro on 25/05/21.
//  Copyright © 2021 carpark. All rights reserved.
//

import UIKit

class UpdateViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nameError: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var phoneTextFields: UITextField!
    @IBOutlet weak var passwordError: UILabel!
    
    @IBOutlet weak var phoneError: UILabel!
    
    @IBOutlet weak var carPlateError: UILabel!
    @IBOutlet weak var carPlateTextField: UITextField!
    private let appStore:AppStore = AppStore()
    
    private let userProfileRepo:UserProfileRepo = UserProfileRepo()
    let fileString:String = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabel()
        
        initializeTextFields()
        
        fileString.getCurrentPath()
        
    }
    
    @IBAction func nameEditingBegin(_ sender: Any) {
        nameError.isHidden=true
        nameTextField.layer.borderWidth=0
        nameTextField.layer.borderColor = UIColor.black.cgColor
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
    
    @IBAction func phoneEditingBegin(_ sender: Any) {
        phoneError.isHidden=true
        phoneTextFields.layer.borderWidth=0
        phoneTextFields.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func carPlateBegin(_ sender: Any) {
        carPlateError.isHidden=true
        carPlateTextField.layer.borderWidth=0
        carPlateTextField.layer.borderColor = UIColor.black.cgColor
    }
    @IBAction func updateAction(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text,let name = nameTextField.text,let phone=phoneTextFields.text,let carPlate=carPlateTextField.text else {
            return
        }
        guard !name.isEmpty else {
            nameError.isHidden = false
            nameError.text="name is empty!"
            nameError.textColor = .red
            nameTextField.layer.borderWidth=1
            nameTextField.layer.borderColor = UIColor.red.cgColor
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
        
        
        guard !phone.isEmpty else {
            phoneError.isHidden = false
            phoneError.text="Please enter phone number!"
            phoneError.textColor = .red
            phoneTextFields.layer.borderWidth=1
            phoneTextFields.layer.borderColor = UIColor.red.cgColor
            return
        }
        guard phone.count == 10  else {
            phoneError.isHidden = false
            phoneError.text="please provide proper phone number!"
            phoneError.textColor = .red
            phoneTextFields.layer.borderWidth=1
            phoneTextFields.layer.borderColor = UIColor.red.cgColor
            return
        }
        guard !carPlate.isEmpty else {
            carPlateError.isHidden = false
            carPlateError.text="Please enter car phone number!"
            carPlateError.textColor = .red
            carPlateTextField.layer.borderWidth=1
            carPlateTextField.layer.borderColor = UIColor.red.cgColor
            return
        }
        guard carPlate.count >= 2 && carPlate.count <= 7  else {
            carPlateError.isHidden = false
            carPlateError.text="car plate is not valid!"
            carPlateError.textColor = .red
            carPlateTextField.layer.borderWidth=1
            carPlateTextField.layer.borderColor = UIColor.red.cgColor
            return
        }
//        setupLabel()
        let userProfile :UserProfile = UserProfile(name: name, email: email, password: password, contactNumber: phone, carPlateNumber: carPlate, userId: UUID(uuidString: appStore.getUserId()) ?? UUID())
        
               let alert = UIAlertController(title: "Update Info", message: "Your user details will updated!", preferredStyle: .alert)
        
        
          alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Update", style: .default, handler: {_ in
            let result = self.userProfileRepo.updateRecord(record: userProfile)
            if result{
                self.showToast(message: "Your account has been updated", font: .systemFont(ofSize: 12.0))
                Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(SignUpController.pop), userInfo: nil, repeats: true)
            }
            else{
                self.showToast(message: "Something Went Wrong", font: .systemFont(ofSize: 12.0))
            }
           
           
        }))
        
        self.present(alert, animated: true, completion: nil)
        
        
        
    }
    @objc func pop(){
        self.navigationController?.popViewController(animated: true)
    }
    private func setupLabel(){
        emailError.text=""
        passwordError.text=""
        nameError.text=""
        phoneError.text=""
        carPlateError.text=""
    }
    
    private func initializeTextFields(){
        let email = appStore.getUserEmail()
    
        let userData = userProfileRepo.checkUserExist(byEmail: email)
      
        if let data = userData{
            nameTextField.text = data.name
            emailTextField.text = data.email
            passwordTextField.text = data.password
            phoneTextFields.text = data.contactNumber
            carPlateTextField.text = data.carPlateNumber
        }
        
        
    }
    
}

