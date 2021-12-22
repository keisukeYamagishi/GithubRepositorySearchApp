//
//  Query.swift
//  GithubRepositorySearch
//
//  Created by keisuke yamagishi on 2021/12/21.
//

import Foundation

class URI {
    static func build(_ query: String) -> String {
        "\(ApiConfiguration.url)?q=\(query)"
    }
}
