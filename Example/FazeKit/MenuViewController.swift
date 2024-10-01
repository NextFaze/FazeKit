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
        case color
        case makeColorLighter
        case makeColorDarker
    }
    
    let items: [MenuItem] = [
        .jailbreak,
        .color,
        .makeColorLighter,
        .makeColorDarker
    ]
    
    let tableView = UITableView()
    static let cellReuseIdentifier = "MenuTableViewCell"
    
    var color = UIColor(hexString: "FF3212")
    
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
    
    func accessoryImageView(for color: UIColor) -> UIView {
        let image = UIImage.coloredImage(color: color, size: CGSize(width: 30, height: 30))
        let imageView = UIImageView(image: image)
        imageView.layer.cornerRadius = 8.0
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.gray.cgColor
        return imageView
    }
    
    @available(iOS 15.0, *)
    func showColorPicker(cell: UITableViewCell) {
        let colorPicker = UIColorPickerViewController()
        colorPicker.sheetPresentationController?.detents = [.medium(), .large()]
        
        colorPicker.title = "Select Color"
        colorPicker.delegate = self
        colorPicker.supportsAlpha = false
        colorPicker.selectedColor = self.color
        self.present(colorPicker, animated: true, completion: nil)
    }

    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuViewController.cellReuseIdentifier) ?? UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: MenuViewController.cellReuseIdentifier)
        cell.textLabel?.text = nil
        cell.detailTextLabel?.text = nil
        cell.accessoryView = nil
        
        let item = self.items[indexPath.row]
        switch item {
        case .jailbreak:
            cell.textLabel?.text = "Jailbroken"
            cell.detailTextLabel?.text = UIDevice.isJailbroken() ? "Yes" : "No"
        case .color:
            cell.textLabel?.text = "Color"
            cell.accessoryView = self.accessoryImageView(for: self.color)
        case .makeColorLighter:
            cell.textLabel?.text = "Make color lighter"
        case .makeColorDarker:
            cell.textLabel?.text = "Make color darker"
        }
        
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = self.items[indexPath.row]
        switch item {
        case .jailbreak:
            break
        case .color:
            guard let cell = tableView.cellForRow(at: indexPath) else { return }
            if #available(iOS 15.0, *) {
                self.showColorPicker(cell: cell)
            }
        case .makeColorLighter:
            self.color = self.color.lighter()
            tableView.reloadData()
        case .makeColorDarker:
            self.color = self.color.darker()
            tableView.reloadData()
        }
    }
}

// MARK: UIColorPickerViewControllerDelegate
@available(iOS 16.0, *)
extension MenuViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        let hex = viewController.selectedColor.hexStringRGB
        print("Selected color with hex: \(hex)")
        self.color = viewController.selectedColor
        self.tableView.reloadData()
    }

    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {

    }
}
