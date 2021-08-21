//
//  LoginController.swift
//  Reqres App
//
//  Created by Girish Parate on 21/08/21.
//

import UIKit

class LoginController: UIViewController {
    static let sharedWebClient = WebClient.init(baseUrl: "https://reqres.in/api")
    
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    var apiTask: URLSessionDataTask!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Do Login
    
    func doLogin(email String,passsword String) {
        
    }
    
    @IBAction func onLoginPress(_ sender: Any) {
    }
}
