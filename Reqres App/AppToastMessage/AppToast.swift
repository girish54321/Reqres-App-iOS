//
//  AppToast.swift
//  Reqres App
//
//  Created by Girish Parate on 21/08/21.
//

import Foundation
import Toast_Swift
struct AppToast {
    
    func ShowToast(self:UIViewController,message:String) {
        self.view.makeToast(message)
    }
    
}
