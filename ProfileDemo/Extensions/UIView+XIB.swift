//
//  UIView+XIB.swift
//  ProfileDemo
//
//  Created by Salma Ashour on 22/05/2021.
//

import UIKit

extension UIView {
    public class func loadXib<T: UIView>(bundle: Bundle = Bundle.main, nibName: String = String("\(T.self)")) -> T? {
        return bundle.loadNibNamed(nibName, owner: self, options: nil)?.first as? T
    }
}
