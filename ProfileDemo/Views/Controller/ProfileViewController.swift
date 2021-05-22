//
//  ViewController.swift
//  ProfileDemo
//
//  Created by Salma Ashour on 21/05/2021.
//

import UIKit

class ProfileViewController: UIViewController {

    var user: User?
    var profileVM: ProfileViewModel?
    var userCellID = "UserTableViewCell"

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: userCellID, bundle: .main), forCellReuseIdentifier: userCellID)

        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.delegate = self
        tableView.dataSource = self

        profileVM = ProfileViewModel()
        profileVM?.fetchUserData { (user, error) in
            self.user = user
            self.tableView.reloadData()
        }
    }
}

extension ProfileViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = HeaderView.loadXib(
            nibName: "HeaderView") as? HeaderView
        if let user = user {
            header?.configure(user: user)
        }
        return header
    }

    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 500
        }

}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: userCellID,
            for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        if let review = user?.reviews {
            cell.configure(
                review: review[indexPath.row])
        }
        return cell
    }
}
