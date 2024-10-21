//
//  LoginViewController.swift
//  StudentAssociationProject
//
//  Created by Maryam Waleed  on 07/11/2023.
import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: ViewController {
    

    @IBOutlet weak var userText: UITextField!

    
    @IBOutlet weak var passText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    //tells me if i'm login in or not
    override func viewDidAppear(_ animated: Bool) {
        
        //guard is like an (if let)
        //if u are logined in it stays logied in
        
        guard let uid = Auth.auth().currentUser?.uid
         else {
             print ("Must Login First")
             return
          }
        //else -> it will take me to the main screen
        performSegue(withIdentifier: "main", sender: self)
        
    }

    
    @IBAction func Login(_ sender: Any) {
        
        let userID = userText.text!
        let pass = passText.text!
        
        //firebase authircation
        Auth.auth().signIn(withEmail: userID, password: pass) { (result, error) in
            
            if let error = error {
                print("Error logging in \(error.localizedDescription)")
                Alert.show("Error", message: "You don't have an account, please Signup.", vc: self)
                return
            }
            
            print("Log in succeseful ")
           

            print("ID is \(result?.user.uid)")
            self.performSegue(withIdentifier: "main", sender: self)
        }
        
        
    }
}
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
     
