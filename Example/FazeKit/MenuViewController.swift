//
// Copyright 2016 NextFaze
//
// Licensed under the Apache License, Version 2.0 (the "License"); you may not
// use this file except in compliance with the License. You may obtain a copy
// of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
// WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
// License for the specific language governing permissions and limitations
// under the License.
//
// ViewController.swift
// FazeKit
//
// Created by rsantos on 12/08/2016.
//

import UIKit
import FazeKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    enum MenuItem {
        case jailbreak
    }
    
    let items: [MenuItem] = [.jailbreak]
    
    let tableView = UITableView()
    static let cellReuseIdentifier = "MenuTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "FazeKit"
        self.view.backgroundColor = UIColor.white
        
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.isOpaque = true
        self.navigationController?.navigationBar.barTintColor = UIColor(hexString: "#ee4136")
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.tableFooterView = UIView()
        self.view.addSubview(self.tableView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.tableView.frame = self.view.bounds
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("WARNING: Memory warning.")
    }

    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuViewController.cellReuseIdentifier) ?? UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: MenuViewController.cellReuseIdentifier)
        
        let item = self.items[indexPath.row]
        switch item {
        case .jailbreak:
            cell.textLabel?.text = "Jailbroken"
            cell.detailTextLabel?.text = UIDevice.isJailbroken() ? "Yes" : "No"
        }
        
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

