//
//  GithubSearchCode.swift
//  GithubRepositorySearch
//
//  Created by keisuke yamagishi on 2021/12/21.
//

import CoreText
import Foundation

struct GithubSearchRepositories: Codable {
    let totalCount: Int64
    let incompleteResults: Bool
    let items: [Repositories]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

struct Repositories: Codable {
    let id: Int64
    let name: String
    let fullName: String
    let `private`: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case `private`
    }
}
