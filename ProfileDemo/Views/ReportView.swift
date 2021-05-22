//
//  ReportView.swift
//  ProfileDemo
//
//  Created by Salma Ashour on 22/05/2021.
//

import UIKit

class ReportView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 30
        layer.masksToBounds = true
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMinXMinYCorner]
    }
}
