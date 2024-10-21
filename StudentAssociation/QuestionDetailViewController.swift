import UIKit
import FirebaseFirestore

class QuestionDetailViewController: UIViewController {
    
    // Firebase collection name
        let collections = Firestore.firestore().collection("QuestionsMaths")
        
    // Reference to Firebase document 2
        let document2 = Firestore.firestore().collection("QuestionsMaths").document("2")
        
    //label
    @IBOutlet weak var questionLabel: UILabel!
    
    // Array to store option buttons
    var optionButtons: [UIButton] = []

    // Current question being displayed
    var currentQuestion: Questions?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Start by getting the first question
        getNextQuestion()
    }
    
    // Fetch the question from the Firebase collection
    func getNextQuestion() {
          collections.getDocuments { [weak self] (querySnapshot, error) in
              guard let self = self, error == nil else {
                  print("Error getting document: \(error!)")
                  return
              }

              if let document = querySnapshot?.documents.first {
                  if let questionData = document.data() as? [String: Any] {
                      let question = Questions(
                        // Create a Questions object from the fetched data
                          Answer: questionData["Answer"] as? String ?? "",
                          explanation: questionData["explanation"] as? String ?? "",
                          optionsAnswer: questionData["optionsAnswer"] as? [String] ?? [],
                          questionText: questionData["questionText"] as? String ?? ""
                      )
                      // Set the current question and display it
                      self.currentQuestion = question
                      self.displayQuestion()
                  }
              }
          }
      }

    
    func displayQuestion() {
        guard let question = currentQuestion else { return }

        // Update the label with the current question text
        questionLabel.text = question.questionText

        // Create buttons for each answer option
        var yOffset: CGFloat = 100 // Adjust this value based on your preference
        for (index, option) in question.optionsAnswer.enumerated() {
            let button = UIButton(type: .system)
            button.setTitle(option, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = UIColor.black
            button.layer.cornerRadius = 8
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            button.addTarget(self, action: #selector(optionButtonTapped(_:)), for: .touchUpInside)
            button.frame = CGRect(x: 90, y: yOffset, width: 200, height: 50)
            yOffset += 60
            optionButtons.append(button)
            self.view.addSubview(button)
        }
    }


    
    // Handle the tap event when an option button is tapped
    @objc func optionButtonTapped(_ sender: UIButton) {
        guard let selectedOption = sender.currentTitle, let correctAnswer = currentQuestion?.Answer else { return }

        if selectedOption == correctAnswer {
            // Correct answer selected
            print("Answer is correct")
            print("Explanation: \(currentQuestion?.explanation ?? "")")

            // Change button color to green
            sender.backgroundColor = UIColor.green

            // Wait for 1 second before moving to the next question
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.optionButtons.forEach { $0.removeFromSuperview() }
                self.optionButtons.removeAll()

                // Reset button colors
                self.optionButtons.forEach { $0.backgroundColor = UIColor.systemBlue }

                // Fetch the next question from Document 2
                self.getNextQuestionFromDocument2()
                
            }
        } else {
            // Change button color to red
            sender.backgroundColor = UIColor.red
            print("Answer is incorrect")
            print("Explanation: \(currentQuestion?.explanation ?? "")")
        }
    }
    
    
    
    // Fetch the next question from Document 2
    func getNextQuestionFromDocument2() {
         document2.getDocument { [weak self] (documentSnapshot, error) in
             guard let self = self, error == nil else {
                 print("Error getting document 2: \(error!)")
                 return
             }

             if let documentData = documentSnapshot?.data() {
                 let question = Questions(
                    // Create a Questions object from the fetched data
                    Answer: documentData["Answer"] as? String ?? "",
                    explanation: documentData["explanation"] as? String ?? "",
                    optionsAnswer: documentData["optionsAnswer"] as? [String] ?? [],
                    questionText: documentData["questionText"] as? String ?? ""
                 )
                 // Set the current question and display it
                 self.currentQuestion = question
                 self.displayQuestion()
                 
                 
              

             }
                 
                 
             }
             }
         
     
  }
