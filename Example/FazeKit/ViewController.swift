//
//  ViewController.swift
//  FazeKit
//
//  Created by Ricardo Santos on 08/12/2016.
//  Copyright (c) 2016 Ricardo Santos. All rights reserved.
//

import UIKit
import FazeKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let testView = UIView(frame: CGRectMake(20.0, 40.0, 120.0, 32.0))
        testView.backgroundColor = UIColor.redColor()
        testView.origin = CGPointMake(40.0, 50.0)
        self.view.addSubview(testView)

        IntegrationTest.printConfirmation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

