//
//  CustomCell.swift
//  PatientList
//
//  Created by Cary Miller on 6/13/19.
//  Copyright © 2019 C.Miller & Co. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(with patient: Patient) {
        lastNameLabel.text = "Last: \(patient.last)"
        firstNameLabel.text = "First: \(patient.first)"
        statusLabel.text = "Status:\n \(patient.status)"
    }

}
