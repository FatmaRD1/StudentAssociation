//
//  Ielts.swift
//  StudentAssociation
//
//  Created by Fatma AlDarwish on 16/11/2023.
//
import Foundation
import FirebaseFirestore
struct Ielts: Codable {
    let DateAndTime: String // Change from Date to Timestamp
    let selectedOption: String
    @DocumentID var documentID: String? // Add this line

    
    // Function to convert Timestamp to String
    func dateString() -> String {
        
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: date)
    }
}
