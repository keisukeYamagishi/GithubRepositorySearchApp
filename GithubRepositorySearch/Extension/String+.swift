//
//  String+.swift
//  GithubRepositorySearch
//
//  Created by keisuke yamagishi on 2021/12/21.
//

import Foundation

extension String {
    func asUrl() throws -> URL {
        guard let url = URL(string: self) else {
            throw NSError(domain: "Invalid URL", code: -10001, userInfo: ["LocalizedSuggestion": "Incorrect URL, let's review the URL"])
        }
        return url
    }
}
