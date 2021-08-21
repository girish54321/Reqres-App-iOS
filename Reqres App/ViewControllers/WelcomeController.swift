//
//  WelcomeController.swift
//  Reqres App
//
//  Created by Girish Parate on 21/08/21.
//

import UIKit

class WelcomeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title="welcome"
        // Do any additional setup after loading the view.
    }
    

    @IBAction func goToInfo(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "UserInfoController") as? UserInfoController else {
            return
        }
        let navVC  = UINavigationController(rootViewController: vc)
        navVC.navigationBar.prefersLargeTitles = true
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
