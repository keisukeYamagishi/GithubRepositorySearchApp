//
//  Throttle.swift
//  GithubRepositorySearch
//
//  Created by keisuke yamagishi on 2021/12/21.
//

import Foundation

class Throttle {
    static let shared = Throttle()
    var startDate: Date?

    init() {}

    static func isThrought(_ second: Int) -> Bool {
        Throttle.shared.isThrought(second)
    }

    func isThrought(_ second: Int) -> Bool {
        if startDate == nil {
            startDate = Date()
            return true
        }
        let startTimeInterval = startDate!.timeIntervalSince1970
        let startTime = Int(startTimeInterval)
        if (Int(Date().timeIntervalSince1970) - startTime) > second {
            startDate = nil
            return true
        } else {
            return false
        }
    }
}
