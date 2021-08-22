//
//  UserInfoController.swift
//  Reqres App
//
//  Created by Girish Parate on 21/08/21.
//

import UIKit

class UserInfoController: UIViewController {

    var userId : String = "";
    var info : UserItem? = nil
    @IBOutlet weak var userInfoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userInfoImage.makeRounded()
        userInfoImage.sd_setImage(with: URL(string: info?.avatar ?? ""))
        title = info?.first_name
        print(userId)
    }
}
