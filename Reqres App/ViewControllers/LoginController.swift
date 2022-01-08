//
//  LoginController.swift
//  Reqres App
//
//  Created by Girish Parate on 21/08/21.
//

import UIKit
import Alamofire

class LoginController: UIViewController {
    
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onLoginPress(_ sender: Any) {
        if(emailInput.text?.isEmpty ?? false && passwordInput.text?.isEmpty ?? false){
            AppToast().ShowToast(self: self, message: "Please fill all the details")
            } else {
                let email : String = emailInput.text ?? ""
                let password :String = passwordInput.text ?? ""
                UserLoginApi(email: email, password: password)
            }
    }
}

// MARK: - Alamofire API CAll
extension LoginController {
    func UserLoginApi(email : String,password : String) {
        let postdata: [String: Any] = [
                "email" : "eve.holt@reqres.in",
                "password":"cityslicka"
        ]
        AF.request("https://reqres.in/api/login",method: .post,parameters: postdata).validate().responseJSON { response in
            print(response)
//            guard let data = response.value else {
//                print(response)
//                print("Error")
//                return
//            }
            guard let data = try? JSONDecoder().decode(LoginResponse.self, from: response.data! ) else {
                print("Error: Couldn't decode data into car")
                return
              }
            AppToast().ShowToast(self: self, message: data.token!)
            let mainNavigationController = self.storyboard?.instantiateViewController(withIdentifier: "MainNavigationController") as! MainNavigationController
            self.present(mainNavigationController, animated: true, completion: nil)
        }
    }
}
