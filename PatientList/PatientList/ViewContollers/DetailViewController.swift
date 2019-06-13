//
//  DetailViewController.swift
//  PatientList
//
//  Created by Cary Miller on 6/13/19.
//  Copyright © 2019 C.Miller & Co. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!

    public var patient: Patient!

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        fullNameLabel.text = "\(patient.last), \(patient.first)"
        statusLabel.text = patient.status
    }

}
