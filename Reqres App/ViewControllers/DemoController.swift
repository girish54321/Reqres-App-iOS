//
//  DemoController.swift
//  Reqres App
//
//  Created by Girish Parate on 15/08/21.
//

import UIKit

class DemoController: UIViewController {

    @IBOutlet weak var appButtonTest: AppButton!
    override func viewDidLoad() {
        super.viewDidLoad()
print("my app is here")
        appButtonTest.lable.text = " HHhHhh"
        appButtonTest.ontap(gon)
        // Do any additional setup after loading the view.
    }
    

    @objc func gon(){
    
    }

}
