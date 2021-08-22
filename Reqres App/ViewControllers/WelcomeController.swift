//
//  WelcomeController.swift
//  Reqres App
//
//  Created by Girish Parate on 21/08/21.
//

import UIKit

class WelcomeController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var userList: UITableView!
    var friendsTask: URLSessionDataTask!
    var friends: [UserItem] = [] {
        didSet {
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Welcome"
        userList.delegate = self
        userList.dataSource = self
//        userList.dataSource = self
//        self.userList.delegate = self
        loadFriends()
    }
    
    private func updateUI() {
        userList.reloadData()
    }
    
     func loadFriends() {
        friendsTask?.cancel()
        
        let exampleDict: [String: Any] = [
                "per_page" : 20,         // type: String
            ]
        
        let parmas = UserRepo().getUserRepo(params: exampleDict)
        
        friendsTask = ViewController.sharedWebClient.load(resource: parmas) {[weak self] response in
            
            guard let controller = self else { return }
            
            DispatchQueue.main.async {
                if let friends = response.value?.data {
                    controller.friends = friends
                    controller.userList.reloadData()
                    print("get have the data",friends[0].avatar)
                } else if let error = response.error {
                    print("errororo")
                    self!.view.makeToast(error.localizedDescription)
                }
            }
        }
    }

    func goToInfo(friend:UserItem) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserInfoController") as? UserInfoController {
            viewController.info = friend
               if let navigator = navigationController {
                   navigator.pushViewController(viewController, animated: true)
               }
           }
        }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return friends.count
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! UserListItemCell
            let friend = friends[indexPath.row]
            cell.setUserItemData(item: friend)
            return cell
        }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let friend = friends[indexPath.row]
            goToInfo(friend: friend)
        }

}



