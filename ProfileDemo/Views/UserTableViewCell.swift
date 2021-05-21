//
//  UserTableViewCell.swift
//  ProfileDemo
//
//  Created by Salma Ashour on 21/05/2021.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var ReviewerNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var reviewerImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(review: Review) {
        self.ReviewerNameLabel.text = review.reviewerName
        self.dateLabel.text = review.date
        self.descriptionLabel.text = review.description
    }

}
