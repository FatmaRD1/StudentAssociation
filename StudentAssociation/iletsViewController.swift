//
//  iletsViewController.swift
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

class iletsViewController: UIViewController {
    
    // Variable to store the selected option
    var selectedOption: String?
    
    
    @IBOutlet weak var DateAndTimePicker: UIDatePicker!
    
    @IBOutlet weak var popupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let optionsClosure = {(action : UIAction) in
            // Store the selected option
            self.selectedOption = action.title
            print(self.selectedOption ?? "")
            
        }
        popupButton.menu = UIMenu(children: [
            UIAction(title: "Reading", state: .on, handler: optionsClosure),
            UIAction(title: "Writing", handler: optionsClosure),
            UIAction(title: "Speaking", handler: optionsClosure),
            UIAction(title: "Listening", handler: optionsClosure)
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
        
        // Assuming you have a collection called "Ielts" in Firestore
        let IletsSubjectsRef = db.collection("Ielts")
        
        // Create a document with a unique identifier (could be based on user ID, for example)
        let documentRef = IletsSubjectsRef.document()
        
        // Update Firebase with the selected option, date, and time
        documentRef.setData(["selectedOption": selectedOption, "DateAndTime": formattedDateTime]) { error in
            if let error = error {
                print("Error updating Firebase: \(error.localizedDescription)")
            } else {
                print("Firebase updated successfully with option: \(selectedOption), date and time: \(formattedDateTime)")
            }
        }
        
    }}
