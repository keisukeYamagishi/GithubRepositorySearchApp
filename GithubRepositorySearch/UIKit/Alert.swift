//
//  Alert.swift
//  GithubRepositorySearch
//
//  Created by keisuke yamagishi on 2021/12/21.
//

import UIKit

// MARK: - Action

public struct AlertAction {
    public let title: String
    public let type: Int
    public let textField: UITextField?
    public let style: UIAlertAction.Style
    public var handler: ((UIAlertAction, [UITextField]?) -> Void)?

    public init(title: String = "",
                type: Int = 0,
                textField: UITextField? = nil,
                placeholder: String? = nil,
                style: UIAlertAction.Style = .default,
                handler: ((UIAlertAction, [UITextField]?) -> Void)? = nil)
    {
        self.title = title
        self.type = type
        self.textField = textField
        if self.textField != nil,
           placeholder != nil
        {
            self.textField?.placeholder = placeholder
        }
        self.handler = handler
        self.style = style
    }
}
