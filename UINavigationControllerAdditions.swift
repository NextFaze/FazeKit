//
//  UINavigationControllerAdditions.swift
//  FazeKit
//
//  Created by Shane Woolcock on 4/10/19.
//

// https://stackoverflow.com/questions/12904410/completion-block-for-popviewcontroller

import Foundation
import UIKit

public extension UINavigationController {
    func pushViewController(_ viewController: UIViewController, animated: Bool, completion: @escaping () -> Void) {
        self.pushViewController(viewController, animated: animated)
        
        if let coordinator = transitionCoordinator, animated {
            coordinator.animate(alongsideTransition: nil) { _ in
                completion()
            }
        } else {
            completion()
        }
    }
    
    func popViewController(animated: Bool, completion: @escaping () -> Void) {
        self.popViewController(animated: animated)
        
        if let coordinator = transitionCoordinator, animated {
            coordinator.animate(alongsideTransition: nil) { _ in
                completion()
            }
        } else {
            completion()
        }
    }
    
    func popToRootViewController(animated: Bool, completion: @escaping () -> Void) {
        self.popToRootViewController(animated: animated)
        
        if let coordinator = transitionCoordinator, animated {
            coordinator.animate(alongsideTransition: nil) { _ in
                completion()
            }
        } else {
            completion()
        }
    }
}
