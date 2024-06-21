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
// UIViewAdditions.swift
// FazeKit
//
// Created by rsantos on 12/08/2016.
//

import UIKit

public extension UIView {
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
        }
    }
    
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }
    
    var left: CGFloat {
        get {
            return self.x
        }
        set {
            self.x = newValue
        }
    }
    
    var right: CGFloat {
        get {
            return self.x + self.width
        }
        set {
            self.x = newValue - self.width
        }
    }
    
    var top: CGFloat {
        get {
            return self.y
        }
        set {
            self.y = newValue
        }
    }
    
    var bottom: CGFloat {
        get {
            return self.y + self.height
        }
        set {
            self.y = newValue - self.height
        }
    }
    
    var centerX: CGFloat {
        get {
            return self.x + self.width/2.0
        }
        set {
            self.x = newValue - self.width/2.0
        }
    }
    
    var centerY: CGFloat {
        get {
            return self.y + self.height/2.0
        }
        set {
            self.y = newValue - self.height/2.0
        }
    }
    
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }
    
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
    
    var origin: CGPoint {
        get {
            return self.frame.origin
        }
        set {
            self.frame.origin = newValue
        }
    }
    
    var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            self.frame.size = newValue
        }
    }
    
    var aspect: CGFloat {
        get {
            return self.height == 0 ? 0 : (self.width / self.height)
        }
    }
    
    func disableTouchDelay(in view: UIView? = nil) {
        let theView: UIView = view ?? self
        (theView as? UIScrollView)?.delaysContentTouches = false
        for subview in theView.subviews {
            self.disableTouchDelay(in: subview)
        }
    }

    func findScrollView() -> UIScrollView? {
        var current: UIView? = self
        while current != nil {
            if let scrollView = current as? UIScrollView {
                return scrollView
            }
            current = current?.superview
        }
        return nil
    }
    
    func findTableView() -> UITableView? {
        var current: UIView? = self
        while current != nil {
            if let tableView = current as? UITableView {
                return tableView
            }
            current = current?.superview
        }
        return nil
    }
    
    func findTableViewCell() -> UITableViewCell? {
        var current: UIView? = self
        while current != nil {
            if let tableViewCell = current as? UITableViewCell {
                return tableViewCell
            }
            current = current?.superview
        }
        return nil
    }
    
    func findCollectionView() -> UICollectionView? {
        var current: UIView? = self
        while current != nil {
            if let collectionView = current as? UICollectionView {
                return collectionView
            }
            current = current?.superview
        }
        return nil
    }
    
    func findCollectionViewCell() -> UICollectionViewCell? {
        var current: UIView? = self
        while current != nil {
            if let collectionViewCell = current as? UICollectionViewCell {
                return collectionViewCell
            }
            current = current?.superview
        }
        return nil
    }
    
    func findTableViewIndexPath() -> IndexPath? {
        guard let tableViewCell = self.findTableViewCell(), let tableView = self.findTableView() else {
            return nil
        }
        return tableView.indexPath(for: tableViewCell)
    }
    
    func findCollectionViewIndexPath() -> IndexPath? {
        guard let collectionViewCell = self.findCollectionViewCell(), let collectionView = self.findCollectionView() else {
            return nil
        }
        return collectionView.indexPath(for: collectionViewCell)
    }
    
    
    func setConstraintsToSuperview(top: CGFloat = 0, leading: CGFloat = 0,
                                          trailing: CGFloat = 0, bottom: CGFloat = 0) {
        guard let superview else { return }
        let safeArea = superview.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: safeArea.topAnchor, constant: top),
            leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: leading),
            trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: trailing),
            bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: bottom)
        ])
    }
    
    func toImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: self.bounds.size)
        let image = renderer.image { ctx in
            self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        }
        return image
    }
}
