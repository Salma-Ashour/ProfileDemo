//
//  ViewController.swift
//  ProfileDemo
//
//  Created by Salma Ashour on 21/05/2021.
//

import UIKit

class ProfileViewController: UIViewController {

    var userCellID = "UserTableViewCell"
    var user: User?

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: userCellID, bundle: .main), forCellReuseIdentifier: userCellID)

        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.delegate = self
        tableView.dataSource = self

        fetchUserData { (user, error) in
            self.user = user
            self.tableView.reloadData()
        }

    }

    func fetchUserData(completion: @escaping (User?, Error?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) { [weak self] in
            guard self != nil else { return }
            if let path = Bundle.main.url(
                forResource: "user_profile",
                withExtension: "json") {
                do {
                    let data = try Data(contentsOf: path, options: .mappedIfSafe)
                    let decoder = JSONDecoder()
                    let userModel = try decoder.decode(User.self, from: data)
                    completion(userModel, nil)
                } catch {
                    print(error.localizedDescription)
                }
            }
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
            return 400
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


extension UIView {
    public class func loadXib<T: UIView>(bundle: Bundle = Bundle.main, nibName: String = String("\(T.self)")) -> T? {
        return bundle.loadNibNamed(nibName, owner: self, options: nil)?.first as? T
    }
}
