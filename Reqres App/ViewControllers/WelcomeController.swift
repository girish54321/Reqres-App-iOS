//
//  WelcomeController.swift
//  Reqres App
//
//  Created by Girish Parate on 21/08/21.
//

import UIKit
import Alamofire

class WelcomeController: UIViewController {
    
    @IBOutlet weak var userList: UITableView!
    var userListData : UserListResponse!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Welcome"
        userList.dataSource = self
        userList.delegate = self
        getUserList()
    }
    
    
    @IBAction func onLogOut(_ sender: Any) {
        let alert = UIAlertController(title: "Logout?", message: "Are you sure?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:nil ))
        alert.addAction(UIAlertAction(title: "Okay",style: .destructive,handler: logOutUser))
        DispatchQueue.main.async { self.present(alert, animated: true) }
    }
    
    func logOutUser(alert: UIAlertAction!)  {
        let isUserLogedIn = false
        UserFlow.saveLoginedInUser(isUserLogedIn: isUserLogedIn)
        performSegue(withIdentifier: "MainAppToAuthVC", sender: nil)
    }
    
    func goToInfo(item:UserListResponseData) {
        SelectedUserSingleton.selectedUserInfo.userData = item
        performSegue(withIdentifier: "goTod", sender: nil)
    }
    @objc func goBack(){
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}

extension WelcomeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userListData?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userList.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! UserListItemCell
        let item = userListData.data?[indexPath.row] ?? nil
        cell.setUserItemData(item: item!)
        return cell
    }
}

extension WelcomeController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = userListData?.data?[indexPath.row]
        self.goToInfo(item: item!)
    }
}

extension WelcomeController {
    func getUserList() {
        let parameters: [String: Any] = [
            "page":"1",
            "per_page":"55"
        ]
        AF.request(AppConst.baseurl+AppConst.usersListUrl,method: .get,parameters: parameters).validate().responseDecodable(of: UserListResponse.self) { [self] (response) in
            guard let data = response.value else {
                print(response)
                print("Error")
                return
            }
            self.userListData = data
            self.userList.reloadData()
        }
    }
}


