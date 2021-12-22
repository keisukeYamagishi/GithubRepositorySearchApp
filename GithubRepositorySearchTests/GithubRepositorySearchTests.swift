//
//  GithubRepositorySearchTests.swift
//  GithubRepositorySearchTests
//
//  Created by keisuke yamagishi on 2021/12/21.
//

@testable import GithubRepositorySearch
import XCTest

class GithubRepositorySearchTests: XCTestCase {
    func testThrottle() throws {
        let exception = expectation(description: #function)
        XCTAssert(Throttle.isThrought(1))
        XCTAssert(!Throttle.isThrought(1))
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            XCTAssert(Throttle.isThrought(1))
            exception.fulfill()
        }
        wait(for: [exception], timeout: 10)
    }

    func testValidURL() {
        do {
            let url = try ApiConfiguration.url.asUrl()
            print(url)
        } catch {
            XCTFail()
        }
    }

    func testUnvalidURL() {
        var isException = false
        do {
            let url = try "こんにちわ世界".asUrl()
            print(url)
        } catch {
            isException = true
        }
        if !isException {
            XCTFail()
        }
    }
}
