//
//  ViewController.swift
//  PatientList
//
//  Created by Cary Miller on 6/13/19.
//  Copyright © 2019 C.Miller & Co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sortOrderSegmentedControl: UISegmentedControl!

    var patients = [Patient]()
    var currentSortOrder = firstName

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }

    private func loadData() {
        patients = patientsData.map() { Patient(with: $0) }
    }

    private func changeSortOrder(to sortOrder: Int) {
        switch sortOrder
        {
        case firstName:
            patients.sort { $0.first < $1.first }
        case lastName:
            patients.sort { $0.last < $1.last }
        case patientStatus:
            patients.sort { $0.status < $1.status }
        default:
            break;
        }
        tableView.reloadData()
        tableView.scrollToTop()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedIndex = tableView.indexPathForSelectedRow?.row else { return }
        if segue.identifier == showDetailSegueID {
            let destination = segue.destination as! DetailViewController
            let patient = patients[selectedIndex]
            destination.patient = patient
        }
    }

    @IBAction func sortOrderSegmentedControlChanged(_ sender: UISegmentedControl) {
        currentSortOrder = Int(sender.selectedSegmentIndex)
        changeSortOrder(to: currentSortOrder)
    }

    @IBAction func addNewPatient(_ sender: Any) {
        let alert = UIAlertController(title: "New Patient", message: "Please input patient's information.", preferredStyle: UIAlertController.Style.alert)

        alert.addTextField { (textField) in
            textField.placeholder = "First Name"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Last Name"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Status"
        }

        let save = UIAlertAction(title: "Save", style: .default) { (alertAction) in
            let firstTextField = alert.textFields![0] as UITextField
            let lastTextField = alert.textFields![1] as UITextField
            let statusTextField = alert.textFields![2] as UITextField

            let newPatient = Patient(first: firstTextField.text!, last: lastTextField.text!, status: statusTextField.text!)

            self.patients.append(newPatient)
            self.changeSortOrder(to: self.currentSortOrder)
        }

        let cancel = UIAlertAction(title: "Cancel", style: .default)
        alert.addAction(save)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patients.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: customCellID, for: indexPath) as! CustomCell
        cell.configure(with: patients[indexPath.row])
        return cell
    }
}

