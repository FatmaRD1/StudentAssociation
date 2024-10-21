//
//  Questions.swift
//  StudentAssociationProject
//
//  Created by Maryam Waleed  on 07/11/2023.
//

import Foundation
struct Questions: Codable{
    let Answer: String //The answer
    let explanation: String // An array to store multiple-choice options
    let optionsAnswer: [String] // The correct answer option
    let questionText: String?//The Question
    
}
