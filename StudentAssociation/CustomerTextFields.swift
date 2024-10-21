//
//  CustomerTextFields.swift
//  StudentAssociation
//
//  Created by Fatma AlDarwish on 07/11/2023.
//

import Foundation
import UIKit


class CustomerTextFields: UITextField {

        required init?(coder: NSCoder) {
            super.init(coder: coder)
            
            setUpUnderlinedTextField()
        }
        
        func setUpUnderlinedTextField(){
            let bottonLayer = CALayer()
            bottonLayer.frame = CGRect(x: 0, y: self.frame.height + 10, width: self.frame.width   , height: 1)
            
            bottonLayer.backgroundColor = UIColor.black.cgColor
            self.layer.addSublayer(bottonLayer)
        }
        func setupLeftImageView(image: UIImage) {
                self.leftViewMode = .always
                let imageView = UIImageView(frame: CGRect(x: 0, y: self.frame.height / 2 - 10 , width: 25, height: 20 ))
                imageView.tintColor = .black
                imageView.image = image
                self.leftView = imageView
           // self.addSubview(leftView!)
            }
    }
