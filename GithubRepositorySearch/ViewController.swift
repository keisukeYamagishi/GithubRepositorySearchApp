//
//  ViewController.swift
//  GithubRepositorySearch
//
//  Created by keisuke yamagishi on 2021/12/21.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet var textField: UITextField!
    @IBOutlet var tableView: UITableView!
    var items: [Repositories] = []
    var originalItems: [Repositories] = []

    @IBAction func editingChangeText(_ sender: UITextField) {
        if !originalItems.isEmpty,
           let text = sender.text
        {
            items = originalItems.filter { $0.name.hasPrefix(text) }
            tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].name
        return cell
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return true }
        GithubRepositories.requet(repositories: text) { [unowned self] githubRepositories in
            self.originalItems = githubRepositories.items
            self.items = githubRepositories.items
            self.textField.text = ""
            self.tableView.reloadData()
        } failuer: { [unowned self] error in
            self.alert(title: "Github API Error",
                       message: error.localizedDescription)
        }
        return true
    }
}
