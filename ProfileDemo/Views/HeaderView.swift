//
//  HeaderView.swift
//  ProfileDemo
//
//  Created by Salma Ashour on 21/05/2021.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userCardView: UIView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userStatusView: UIView!
    @IBOutlet weak var userCountry: UILabel!
    @IBOutlet weak var userJob: UILabel!
    @IBOutlet weak var userRateView: UIView!
    @IBOutlet weak var requestButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.cornerRadius = 30
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]

        userCardView.layer.cornerRadius = 30
        userCardView.layer.masksToBounds = true
        
    }

    func configure(user: User) {
        usernameLabel.text = user.name
        userCountry.text = user.country
        userJob.text = user.job
    }
}
