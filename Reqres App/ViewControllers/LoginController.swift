//
//  LoginController.swift
//  Reqres App
//
//  Created by Girish Parate on 21/08/21.
//

import UIKit
import Toast_Swift

class LoginController: UIViewController {
    static let sharedWebClient = WebClient.init(baseUrl: "https://reqres.in/api")
    
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    var apiTask: URLSessionDataTask!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Do Login
    func doLogin(email :String,passsword :String) {
        apiTask?.cancel()
        let postdata: [String: Any] = [
                "email" : "eve.holt@reqres.in",
                "password":"cityslicka"
        ]
        let parmas = AuthAPIController().loginUser(params: postdata)
        
        apiTask = ViewController.sharedWebClient.load(resource: parmas) {[weak self] response in
            
            DispatchQueue.main.async {
                if let data = response.value {
                    print(data.token)
                    AppToast().ShowToast(self: self!, message: data.token)
                    guard let vc = self!.storyboard?.instantiateViewController(identifier: "WelcomeController") as? WelcomeController else {
                        return
                    }
                    let navVC  = UINavigationController(rootViewController: vc)
                    navVC.navigationBar.prefersLargeTitles = true
                    navVC.modalPresentationStyle = .fullScreen
                    self!.present(navVC, animated: true, completion: nil)
                    
                } else if response.error != nil {
                    APIError().handleError(response.error!, self: self!)
                    
                }
            }
        }
    }
    
    @IBAction func onLoginPress(_ sender: Any) {
        if(emailInput.text?.isEmpty ?? false && passwordInput.text?.isEmpty ?? false){
            AppToast().ShowToast(self: self, message: "Please fill all the details 1")
            }else{
               
                let email : String = emailInput.text ?? ""
                let password :String = passwordInput.text ?? ""
                doLogin(email: email, passsword: password)

            }
    }
//    @IBAction func onCreateNewAccount(_ sender: Any) {
//        goToCreateAccount()
//    }
//    
//    func goToCreateAccount() {
////        present(CreateAccountController(), animated: true, completion: nil)
////        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CreateAccountController") as! CreateAccountController
////           self.present(vc, animated: true, completion: nil)
//        
//        guard let vc = storyboard?.instantiateViewController(identifier: "CreateAccountController") as? CreateAccountController else {
//            return
//        }
//        let navVC  = UINavigationController(rootViewController: vc)
//        navVC.navigationBar.prefersLargeTitles = true
//        navVC.modalPresentationStyle = .fullScreen
//        navVC.navigationBar = UINavigationBar()
////        navVC.modalPresentationStyle = .overFullScreen
//        present(navVC, animated: true, completion: nil)
//    }
}
