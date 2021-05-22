//
//  ProfileViewModel.swift
//  ProfileDemo
//
//  Created by Salma Ashour on 22/05/2021.
//

import Foundation

class ProfileViewModel {

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
