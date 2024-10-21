//
//  DocumentViewController.swift
//  StudentAssociation
//
//  Created by Fatma AlDarwish on 15/11/2023.
//

import UIKit
import MobileCoreServices

class DocumentViewController: UIViewController, URLSessionDelegate , UIImagePickerControllerDelegate , UINavigationControllerDelegate, UIDocumentPickerDelegate {
    
    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        documentPicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func onSelectPhotoClick(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let imagePicker = UIImagePickerController()
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true , completion: nil)
        }else{
            print("photo source type not avaliable")
        }
    }
    
    func imagePickerController (_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        // Dismiss the image picker, removing it from the screen
        picker.dismiss(animated: true, completion: nil)
        
        // Extract the selected image from the info dictionary
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        // Set the selected image to be displayed in the 'imgView' UIImageView
        imgView.image = image
        
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the image picker without taking any action
        picker.dismiss(animated: true,completion: nil)
    }
    
    
    let documentPicker = UIDocumentPickerViewController(documentTypes: ["public.data"], in: .import)
    
    @IBAction func uploadButtonTapped(_ sender: Any) {
        present(documentPicker, animated: true, completion: nil)
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let url = urls.first else {
            return
        }
        
        if controller == documentPicker {
            // Document picked from the first document picker
            // Process the selected document for upload or other actions
            print("Selected document from documentPicker: \(url)")
        }
        
        
        
        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            // Handle cancellation if needed
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
