//
//  CreateAccountController.swift
//  Reqres App
//
//  Created by Girish Parate on 21/08/21.
//

import UIKit

class CreateAccountController: UIViewController {

    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    var apiTask: URLSessionDataTask!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //Do Login
    func createAccount(email :String,passsword :String) {
        apiTask?.cancel()
        let postdata: [String: Any] = [
                "email" : "eve.holt@reqres.in",
                "password":"cityslicka"
        ]
        let parmas = AuthAPIController().CrateUser(params: postdata)
        
        apiTask = ViewController.sharedWebClient.load(resource: parmas) {[weak self] response in
            
            DispatchQueue.main.async {
                if let data = response.value {
                    print(data.token)
                    AppToast().ShowToast(self: self!, message: data.token)
                    let mainNavigationController = self!.storyboard?.instantiateViewController(withIdentifier: "MainNavigationController") as! MainNavigationController
                    self!.present(mainNavigationController, animated: true, completion: nil)
                } else if response.error != nil {
                    APIError().handleError(response.error!, self: self!)
                    
                }
            }
        }
    }
    
    @IBAction func createAccount(_ sender: Any) {
        if(emailInput.text?.isEmpty ?? false && passwordInput.text?.isEmpty ?? false){
            AppToast().ShowToast(self: self, message: "Please fill all the details 1")
            }else{
                let email : String = emailInput.text ?? ""
                let password :String = passwordInput.text ?? ""
                createAccount(email: email, passsword: password)
            }
    }
}
