//
//  SATViewController.swift
//  StudentAssociation
//
//  Created by Fatma AlDarwish on 07/11/2023.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth

class SATViewController: UIViewController {
    @IBOutlet weak var popupButton: UIButton!

    
    @IBOutlet weak var DateAndTimePicker: UIDatePicker!
    @IBOutlet weak var login: UIButton!
    // Variable to store the selected option
    var selectedOption: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let optionsClosure = {(action : UIAction) in
            // Store the selected option
            self.selectedOption = action.title
            print(self.selectedOption ?? "")
            
        }
        popupButton.menu = UIMenu(children: [
            UIAction(title: "Mathematics", state: .on, handler: optionsClosure),
            UIAction(title: "Reading & Writing", handler: optionsClosure),
            UIAction(title: "Essay", handler: optionsClosure)
        ])
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveData(_ sender: Any) {
        
        // Check if an option is selected
        guard let selectedOption = selectedOption else {
            print("No option selected.")
            return
        }
        
        // Get the selected date and time
        let selectedDateTime = DateAndTimePicker.date
        
        // Convert the date and time to a formatted string if needed
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let formattedDateTime = dateFormatter.string(from: selectedDateTime)
        
        // Assuming you have already configured Firebase in your app
        let db = Firestore.firestore()
        
        // Assuming you have a collection called "SATSubjects" in Firestore
        let satSubjectsRef = db.collection("SATSubjects")
        
        // Create a document with a unique identifier (could be based on user ID, for example)
        let documentRef = satSubjectsRef.document()
        
        // Update Firebase with the selected option, date, and time
        documentRef.setData(["selectedOption": selectedOption, "dateAndTime": formattedDateTime]) { error in
            if let error = error {
                print("Error updating Firebase: \(error.localizedDescription)")
            } else {
                print("Firebase updated successfully with option: \(selectedOption), date and time: \(formattedDateTime)")
            }
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
    

