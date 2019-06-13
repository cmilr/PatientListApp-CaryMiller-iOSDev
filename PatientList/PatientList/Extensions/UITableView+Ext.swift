//
//  UITableView+Ext.swift
//  PatientList
//
//  Created by Cary Miller on 6/13/19.
//  Copyright © 2019 C.Miller & Co. All rights reserved.
//

import UIKit

extension UITableView {
    func scrollToTop() {
        let indexPath = NSIndexPath(row: 0, section: 0)
        self.scrollToRow(at: indexPath as IndexPath, at: .top, animated: false)
    }
}
