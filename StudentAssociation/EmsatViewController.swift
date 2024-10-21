//
//  EmsatViewController.swift
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

class EmsatViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var DateAndTime: UIDatePicker!
    
    // Variable to store the selected option
    var selectedOption: String?
    
    let SubjectList = ["Arabic","English","Mathematics","Chemistry","Physics","Biology"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        picker.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return SubjectList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return SubjectList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Update the selectedOption based on the user's selection in the picker
        selectedOption = SubjectList[row]
    }
    
    
    @IBAction func saveData(_ sender: Any) {
        // Check if an option is selected
        guard let selectedOption = selectedOption else {
            print("No option selected.")
            return
        }
        
        // Get the selected date and time
        let selectedDateTime = DateAndTime.date
        
        // Convert the date and time to a formatted string if needed
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let formattedDateTime = dateFormatter.string(from: selectedDateTime)
        
        // Assuming you have already configured Firebase in your app
        let db = Firestore.firestore()
        
        // Assuming you have a collection called "Emsat" in Firestore
        let emsatRef = db.collection("Emsat")
        
        // Create a document with a unique identifier (could be based on user ID, for example)
        let documentRef = emsatRef.document()
        
        // Update Firebase with the selected option, date, and time
        documentRef.setData(["selectedOption": selectedOption, "DateAndTime": formattedDateTime]) { error in
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


