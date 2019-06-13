//
//  Patient.swift
//  PatientList
//
//  Created by Cary Miller on 6/13/19.
//  Copyright © 2019 C.Miller & Co. All rights reserved.
//

import Foundation

struct Patient {
    var first: String
    var last: String
    var status: String

    init(first: String, last: String, status: String) {
        self.first = first
        self.last = last
        self.status = status
    }

    init(with dictionary: [String: String]) {
        self.first = dictionary["first"] ?? "Unknown"
        self.last = dictionary["last"] ?? "Unknown"
        self.status = dictionary["status"] ?? "Unknown"
    }
}
