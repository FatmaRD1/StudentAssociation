import UIKit
import FirebaseFirestore
import FirebaseFirestoreSwift

class IletsTableViewController: UITableViewController {

    let cellReuseIdentifier = "cell"
    var ilets: [Ielts] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

        readAllSubjects()
    }

    func readAllSubjects() {
        Firestore.firestore().collection("Ielts").getDocuments { [weak self] (querySnapshot, error) in
            guard let self = self else { return }

            if let error = error {
                print("Error: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    do {
                        let iletsData = try document.data(as: Ielts.self)
                        let dateString = iletsData.dateString()
                        print(dateString)
                        self.ilets.append(iletsData)
                    } catch {
                        print("Error decoding document: \(error)")
                    }
                }

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ilets.count
    }

    // Add any other necessary UITableViewDelegate methods here
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)

        let iletsData = ilets[indexPath.row]
        let dateString = iletsData.dateString()

        // Combine date and selected option for display
        let displayText = "\(dateString) - Selected Option: \(iletsData.selectedOption)"
        cell.textLabel?.text = displayText

        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow,
           let destinationVC = segue.destination as? QuestionViewController {
            let selectedIlets = ilets[indexPath.row]
            destinationVC.iletsData = selectedIlets
        }
    }
   }


