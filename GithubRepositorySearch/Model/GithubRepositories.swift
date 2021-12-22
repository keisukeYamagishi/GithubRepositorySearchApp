//
//  GithubRepositories.swift
//  GithubRepositorySearch
//
//  Created by keisuke yamagishi on 2021/12/21.
//

import Foundation

class GithubRepositories {
    static func requet(repositories: String,
                       completion: @escaping (GithubSearchRepositories) -> Void,
                       failuer: @escaping (Error) -> Void)
    {
        guard Throttle.isThrought(10) else {
            return
        }
        ApiClient.shared.request(url: URI.build(repositories)).send { data, responce, error in
            print("responce: \(String(describing: responce))")
            if let httpResponce = responce {
                if 200 ... 300 ~= httpResponce.statusCode {
                    do {
                        let json = try JSONDecoder().decode(GithubSearchRepositories.self, from: data!)
                        completion(json)
                    } catch {
                        print("Exception: \(error)")
                        failuer(error)
                    }
                } else {
                    failuer(NSError(domain: "Http Status code",
                                    code: httpResponce.statusCode,
                                    userInfo: ["Http response status code:": "Status: code: \(httpResponce.statusCode)"]))
                }
            } else if let err = error {
                failuer(err)
            }
        }
    }
}
