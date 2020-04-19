//
//  RootViewController.swift
//  iOS-FirebaseSample
//
//  Created by yaiwamoto on 20/04/2020.
//  Copyright © 2020 Yasutaka Iwamoto. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
}

extension RootViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Row.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = Row.allCases[indexPath.row].rawValue
        return cell
    }
}

extension RootViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row =  Row(rawValue: Row.allCases[indexPath.row].rawValue)
        switch row {
        case .authentication:
            if let vc = UIStoryboard(name: "AuthenticationViewController", bundle: nil).instantiateInitialViewController() {
                navigationController?.pushViewController(vc, animated: true)
            }
        case .firestore:
            if let vc = UIStoryboard(name: "FireStoreViewController", bundle: nil).instantiateInitialViewController() {
                navigationController?.pushViewController(vc, animated: true)
            }
        case .none:
            break
        }
    }
}

enum Row: String, CaseIterable {
    case authentication
    case firestore
}
