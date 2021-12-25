//
//  CreateAccountController.swift
//  Reqres App
//
//  Created by Girish Parate on 21/08/21.
//

import UIKit
import Alamofire

class CreateAccountController: UIViewController {

    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

  
    @IBAction func createAccount(_ sender: Any) {
        if(emailInput.text?.isEmpty ?? false && passwordInput.text?.isEmpty ?? false) {
            AppToast().ShowToast(self: self, message: "Please fill all the details 1")
            } else {
                let email : String = emailInput.text ?? ""
                let password :String = passwordInput.text ?? ""
                UserCreateAccountApi(email: email, password: password)
            }
    }
}


extension CreateAccountController {
    func UserCreateAccountApi(email : String,password : String) {
        let postdata: [String: Any] = [
                "email" : "eve.holt@reqres.in",
                "password":"cityslicka"
        ]
        AF.request("https://reqres.in/api/register",method: .post,parameters: postdata).validate().responseDecodable(of: RegisterResponse.self) { (response) in
            print(response)
            guard let data = response.value else {
                print(response)
                print("Error")
                return
            }
            AppToast().ShowToast(self: self, message: data.token!)
            let mainNavigationController = self.storyboard?.instantiateViewController(withIdentifier: "MainNavigationController") as! MainNavigationController
            self.present(mainNavigationController, animated: true, completion: nil)
        }
    }
}
