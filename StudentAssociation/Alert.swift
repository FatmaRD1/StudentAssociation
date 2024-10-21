//
//  Alert.swift
//  TouchIDTest
//

import UIKit

class Alert: NSObject {
    
 
 // This is a custom alert class that has two static methods to call.
 // The first one to show general alert.  The second one is to show confirmation message
 // the second one is has a completion handler which means the funcion call waits until the user
 // makes a choice.
  

/************************************************************************/
// * General Alert 
/************************************************************************/
 static func show(_ title:String, message:String, vc:UIViewController)
  {
    // Create The Controller
    
    let alertCT = UIAlertController(title: title, message: message , preferredStyle: UIAlertController.Style.alert)
    
    // Create Alert Action
    
        let okAc = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { (alert:UIAlertAction) -> Void in
     
        alertCT.dismiss(animated: true, completion: nil)
    }
    
    // Add Alert Actions to Alert Controller
    alertCT.addAction(okAc)
    
    // Display Alert Controller
    vc.present(alertCT, animated: true, completion: nil)
    
  }

 /************************************************************************/
 // * Confirmaiton Alert with acitons
 /************************************************************************/
 static func showConfirmation(_ title:String, message:String, vc:UIViewController , completion:@escaping (_ isOK:Bool) -> Void )
    {
        
        
        // Create The Controller
        
        let alertCT = UIAlertController(title: title, message: message , preferredStyle: UIAlertController.Style.alert)
        
     
        
        // Create Alert Action
        
        let okAc = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default) {
            (alert:UIAlertAction) -> Void in
            completion(true)
            alertCT.dismiss(animated: true, completion: nil )
          
            
        }
        
        
        let cancelAc = UIAlertAction(title: "NO ", style: UIAlertAction.Style.default) { (alert:UIAlertAction) -> Void in
            completion(false)
            alertCT.dismiss(animated: true, completion: nil)
            
        }
        
        // Add Alert Actions to Alert Controller
        
        alertCT.addAction(cancelAc)
        alertCT.addAction(okAc)
        
      
        // Display Alert Controller
        
        vc.present(alertCT, animated: true, completion: nil)
        
        
        
    }
    


}
