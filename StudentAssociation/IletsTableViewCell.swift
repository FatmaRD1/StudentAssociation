//
//  IletsTableViewCell.swift
//  StudentAssociation
//
//  Created by Fatma AlDarwish on 16/11/2023.
//

import UIKit

class IletsTableViewCell: UITableViewCell {

    @IBOutlet weak var LBLSub: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}