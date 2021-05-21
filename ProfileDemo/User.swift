//
//  User.swift
//  ProfileDemo
//
//  Created by Salma Ashour on 21/05/2021.
//

import Foundation

public struct User: Codable {
    let name: String?
    let job: String?
    let country: String?
    let status: String?
    let rate: Double?
    let reviews: [Review]?

    enum CodingKeys: String, CodingKey {
        case name
        case job
        case country
        case status
        case rate
        case reviews
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        job = try values.decodeIfPresent(String.self, forKey: .job)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        rate = try values.decodeIfPresent(Double.self, forKey: .rate)
        reviews = try values.decodeIfPresent([Review].self, forKey: .reviews)
    }
}

public struct Review: Codable {
    let reviewerName: String?
    let reviewerRate: Double?
    let date: String?
    let description: String?

    enum CodingKeys: String, CodingKey {
        case reviewerName
        case reviewerRate
        case date
        case description

    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        reviewerName = try values.decodeIfPresent(String.self, forKey: .reviewerName)
        reviewerRate = try values.decodeIfPresent(Double.self, forKey: .reviewerRate)
        date = try values.decodeIfPresent(String.self, forKey: .date)
        description = try values.decodeIfPresent(String.self, forKey: .description)
    }
}
