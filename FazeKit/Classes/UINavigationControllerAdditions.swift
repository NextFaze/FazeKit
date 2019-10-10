//
//  UINavigationControllerAdditions.swift
//  FazeKit
//
//  Created by Shane Woolcock on 10/10/19.
//

import Foundation

public extension UINavigationController {
    func firstViewController<T: UIViewController>(ofKind kind: T.Type = T.self) -> T? {
        return self.viewControllers.first(where: { $0 is T }) as? T
    }
}
