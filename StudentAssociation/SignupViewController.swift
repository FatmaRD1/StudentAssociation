//
//  SignupViewController.swift
//  StudentAssociationProject
//
//  Created by Maryam Waleed  on 07/11/2023.
//

import UIKit
import Firebase
import FirebaseAuth

class SignupViewController: ViewController {

    @IBOutlet weak var nameText: CustomerTextFields!
    
    @IBOutlet weak var emailText: CustomerTextFields!
    
    @IBOutlet weak var passwordText: CustomerTextFields!
    
    @IBOutlet weak var phoneText: CustomerTextFields!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func Register(_ sender: Any) {
        
        // Get the information the information and validate
        let email = emailText.text!
        let pass = passwordText.text!
        
        // Check if email and password are not empty
        guard !email.isEmpty, !pass.isEmpty else {
            Alert.show("Error", message: "Please fill in both email and password fields", vc: self)
            return
        }
        //Auth.auth()-> firebase authintaction, it will give me access to the firebase authintaction
        
        //we will get -> result or error
        //result -> create an account
        Auth.auth().createUser(withEmail: email, password: pass) { (result, error ) in
            
            if let err = error {
                print("Error creating user \(err.localizedDescription)")
                return
            }
            
            //we will print the user name and id, everything happen from the id so its very important
            print("User is create \(result!.user.displayName)")
            print("User is ID  \(result!.user.uid)")
            
            
            
        }
        
    }
}
