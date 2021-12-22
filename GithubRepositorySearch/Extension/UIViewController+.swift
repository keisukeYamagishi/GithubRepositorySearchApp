//
//  UIViewController+.swift
//  GithubRepositorySearch
//
//  Created by keisuke yamagishi on 2021/12/21.
//

import UIKit

// MARK: - UIAlertController

public extension UIAlertController {
    func addAction(actions: [AlertAction]) {
        actions.forEach { action in
            self.addAction(UIAlertAction(title: action.title,
                                         style: action.style,
                                         handler: { [unowned self] alertAction in
                                             action.handler?(alertAction, self.textFields)
                                         }))
        }
    }
}

// MARK: - UIViewController

public extension UIViewController {
    func alert(title: String?,
               message: String? = nil,
               actions: [AlertAction] = [AlertAction(title: "OK")],
               preferredStyle: UIAlertController.Style = .alert,
               vc: UIViewController? = nil)
    {
        let parentVc = vc ?? self
        let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        alertController.addAction(actions: actions)
        parentVc.present(alertController, animated: true)
        // TODO: Please delete follwoing code when it's fixed.
        alertController.view.subviews.forEach {
            $0.removeConstraints($0.constraints.filter { $0.description.contains("width == - 16") })
        }
    }
}
