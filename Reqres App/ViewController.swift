//
//  ViewController.swift
//  Reqres App
//
//  Created by Girish Parate on 15/08/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableview: UITableView!
    var friendsTask: URLSessionDataTask!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.tableFooterView = UIView(frame: .zero)
        loadFriends()
    }
    
    private func showErrorAlert(with message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func moveToLogin() {
        
    }
    
    @IBAction private func loadFriends() {
    }
    
    private func updateUI() {
        tableview.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return friends.count
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath)
//        let friend = friends[indexPath.row]
//        cell.textLabel?.text = friend.first_name
//        cell.detailTextLabel?.text = friend.email
        return cell
    }
}



