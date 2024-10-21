//
//  QuestionViewController.swift
//  StudentAssociation
//
//  Created by Fatma AlDarwish on 14/11/2023.
//

import UIKit
import FirebaseFirestore
import FirebaseFirestoreSwift

class QuestionViewController: UIViewController {
    var iletsData: Ielts?
    let db = Firestore.firestore()
    let collection = Firestore.firestore().collection("Ielts")
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var selectedOptionLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let iletsData = iletsData {
            // Display date in a label
            dateLabel.text = "Date: \(iletsData.dateString() ?? "N/A")"
            
            // Display selected option in another label
            selectedOptionLabel.text = "Selected Option: \(iletsData.selectedOption)"
        }
    }
    
     @IBAction func Delete(_ sender: Any) {
         let alert = UIAlertController(title: "Confirm Deletion", message: "Are you sure you want to delete this document?", preferredStyle: .alert)

              let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
              alert.addAction(cancelAction)

              let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { [weak self] _ in
                  self?.deleteDocumentFromFirebase()
              }
              alert.addAction(deleteAction)

              present(alert, animated: true, completion: nil)
     }


    private func deleteDocumentFromFirebase() {
        // Implement Firebase delete logic here
        if let iletsData = iletsData, let documentID = iletsData.documentID {
            let documentRef = db.collection("Ielts").document(documentID)
            
            documentRef.delete { error in
                if let error = error {
                    print("Error deleting document: \(error.localizedDescription)")
                } else {
                    print("Document deleted successfully.")
                    // Navigate back to the previous screen or perform any other necessary actions
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }

    /*
     //search
     @IBAction func search(_ sender: Any) {
     
     let id = suppliertxt.text!
     
     //it search for the record in the firebase
     let query = collection.whereField("supplier", isEqualTo: id)
     
     // Execute the query and retrieve documents or an error.
     query.getDocuments { querySnapShot, error in
     if let error {
     self.msg.text = "Error getting Data \(error.localizedDescription)"
     } else
     {
     for document in querySnapShot!.documents {
     //get the feild from the firebase
     let record = document.data()
     let id = record["Id"]!
     let supplier = record["supplier"]!
     let serial = record["serial"]!
     let price = record["price"]! as? Int
     
     
     //create a string that display the data
     let str = " id: \(id) \n supplier: \(supplier) \n" +
     " serial: \(serial) \n Price:\(price!) "
     
     self.msg.text!.append(str)
     }
     }
     }
     }
     
     */
    
    
    
    
     //update
     @IBAction func updateRecord(_ sender: Any) {
     
         if let documentID = iletsData?.documentID {
                    // Create a reference to the document in Firestore
                    let documentRef = collection.document(documentID)
                    
                
                    let updatedSelectedOption = "New Selected Option"
                    
                    // Update the data in Firestore
                    documentRef.updateData(["selectedOption": updatedSelectedOption]) { error in
                        if let error = error {
                            print("Error updating document: \(error.localizedDescription)")
                        } else {
                            print("Document updated successfully.")
                            // Perform any other necessary actions
                        }
                    }
                }
         
     }
     
     
    
    /*
     //logout
     @IBAction func logout(_ sender: Any) {
     do {
     try Auth.auth().signOut()
     self.msg.text = "Signed Out"
     } catch {
     self.msg.text = "Unable To Sign Out"
     }
     }
     
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}
