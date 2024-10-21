//
//  ServicesViewController.swift
//  StudentAssociation
//
//  Created by Fatma AlDarwish on 16/11/2023.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth

class ServicesViewController: UIViewController {
    @IBOutlet weak var logout: UIButton!
    @IBOutlet weak var msg: UILabel!
    @IBOutlet weak var doc: UIButton!
    @IBOutlet weak var ilets: UIButton!
    @IBOutlet weak var emsat: UIButton!
    @IBOutlet weak var sat: UIButton!
    var handler : AuthStateDidChangeListenerHandle?
    @IBOutlet weak var login: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //hide login + logout + update
    override func viewWillAppear(_ animated: Bool) {
        handler = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if user == nil {
                // User is not signed in
                print("login")
                
                
                self.login.isHidden = false
                
                self.doc.isHidden = true
                self.sat.isHidden = true
                self.emsat.isHidden = true
                self.ilets.isHidden = true
            } else {
                // User is signed in
                print("user is signed in")
                
                self.logout.isHidden = false
                self.login.isHidden = true
                
                self.doc.isHidden = false
                self.sat.isHidden = false
                self.emsat.isHidden = false
                self.ilets.isHidden = false
            }
        })
    }

    override func viewWillDisappear(_ animated: Bool) {
        // Remove the state change listener when the view is about to disappear
        Auth.auth().removeStateDidChangeListener(handler!)
    }

    @IBAction func logout(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            self.msg.text = "Signed Out"
        } catch {
            self.msg.text = "Unable To Sign Out"
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

                                                   
}
