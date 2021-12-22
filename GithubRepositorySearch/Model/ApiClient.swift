//
//  ApiClient.swift
//  GithubRepositorySearch
//
//  Created by keisuke yamagishi on 2021/12/21.
//

import Foundation

class ApiClient: NSObject {
    static let shared = ApiClient()
    typealias CompletionHandler = (Data?, HTTPURLResponse?, Error?) -> Void
    var dataTask: URLSessionDataTask?
    var responceData: Data?
    var urlResponse: HTTPURLResponse?
    var request: URLRequest?
    var completionHandler: CompletionHandler?

    override init() {}

    func request(url: String) -> ApiClient {
        do {
            request = try URLRequest(url: url.asUrl())
        } catch {
            print("Exception: \(error)")
        }
        return self
    }

    func send(completion: @escaping (Data?, HTTPURLResponse?, Error?) -> Void) {
        completionHandler = completion
        let urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
        guard let urlRequest = request else { return }
        dataTask = urlSession.dataTask(with: urlRequest)
        dataTask?.resume()
    }
}

extension ApiClient: URLSessionDataDelegate, URLSessionTaskDelegate {
    /*
     * Get Responce and Result
     *
     *
     */
    public func urlSession(_: URLSession, task _: URLSessionTask, didCompleteWithError error: Error?) {
        completionHandler?(responceData, urlResponse, error)
    }

    /*
     * get recive function
     *
     */
    public func urlSession(_: URLSession, dataTask _: URLSessionDataTask, didReceive data: Data) {
        recivedData(data)
    }

    /*
     * get Http response
     *
     */
    public func urlSession(_: URLSession,
                           dataTask _: URLSessionDataTask,
                           didReceive response: URLResponse,
                           completionHandler: @escaping (URLSession.ResponseDisposition) -> Void)
    {
        urlResponse = response as? HTTPURLResponse
        completionHandler(.allow)
    }

    func recivedData(_ data: Data) {
        if responceData == nil {
            responceData = data
        } else {
            responceData?.append(data)
        }
    }
}
