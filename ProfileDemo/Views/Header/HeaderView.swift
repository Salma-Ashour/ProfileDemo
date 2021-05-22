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

        userStatusView.layer.cornerRadius = 6.5
        userStatusView.layer.masksToBounds = true

        requestButton.layer.cornerRadius = 12
        requestButton.layer.masksToBounds = true

        userCardView.layer.shadowColor = UIColor.black.cgColor
        userCardView.layer.shadowOffset = CGSize(width: 0, height: 1)
        userCardView.layer.shadowRadius = 10
        userCardView.layer.shadowOpacity = 0.16
        userCardView.layer.masksToBounds = false
        
    }

    func configure(user: User) {
        usernameLabel.text = user.name
        userCountry.text = user.country
        userJob.text = user.job
    }

    func addingShadow(size: CGSize, radius: CGFloat, opacity: Float) {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = size
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
    }

    @IBAction func reguestButtonClicked(_ sender: Any) {
        requestButton.setTitle("Request Sent ✅", for: .normal)
        requestButton.backgroundColor = .gray
    }
    
}
