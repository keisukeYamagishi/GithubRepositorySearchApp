//
//  ApiConfiguration.swift
//  GithubRepositorySearch
//
//  Created by keisuke yamagishi on 2021/12/21.
//

import Foundation

enum ApiConfiguration {
    static let domain = "https://api.github.com"
    static let endpoint = "/search/repositories"
    static let url = "\(domain)\(endpoint)"
}
