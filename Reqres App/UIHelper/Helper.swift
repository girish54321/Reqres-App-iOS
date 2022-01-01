//
//  Helper.swift
//  UserList
//
//  Created by Girish Parate on 07/08/21.
//

import UIKit

extension UIImageView {

    func makeRounded() {
        self.layer.cornerRadius = 8.0
        self.clipsToBounds = true
    }
}

extension String {
    mutating func addString(str: String) {
        self = self + str
    }
}
