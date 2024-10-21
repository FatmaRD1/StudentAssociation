//
//  UpdateViewController.swift
//  StudentAssociation
//
//  Created by Fatma AlDarwish on 16/11/2023.
//

import UIKit
import FirebaseFirestore
import FirebaseFirestoreSwift


class UpdateViewController: UIViewController {
    var iletsData: Ielts?
    let db = Firestore.firestore()
    let collection = Firestore.firestore().collection("Ielts")
    
    @IBOutlet weak var DateAndTimeUP: UIDatePicker!
    
    @IBOutlet weak var popupButton: UIButton!
    var selectedOption: String?
    
    
    
    
    
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
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    @IBAction func update(_ sender: Any) {
        if let iletsData = iletsData, let documentID = iletsData.documentID {
               let documentRef = collection.document(documentID)

               // Modify the properties you want to update
               let updatedSelectedOption = selectedOption ?? ""
               let updatedDateTime = DateAndTimeUP.date

               // Convert the date and time to a Firestore Timestamp
               let timestamp = Timestamp(date: updatedDateTime)

               // Update the data in Firestore
               documentRef.updateData([
                   "selectedOption": updatedSelectedOption,
                   "DateAndTime": timestamp
               ]) { error in
                   if let error = error {
                       print("Error updating document: \(error.localizedDescription)")
                       Alert.show("Unsuccessful", message: "Document Couldnt be updated.", vc: self)
                   } else {
                       print("Document updated successfully.")
                       // Perform any other necessary actions
                       Alert.show("Successful", message: "Document updated successfully.", vc: self)
                   }
               }
           }
           }
}

