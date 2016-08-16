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

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let testView = UIView(frame: CGRectMake(20.0, 40.0, 120.0, 32.0))
        testView.backgroundColor = UIColor.redColor()
        testView.origin = CGPointMake(40.0, 50.0)
        self.view.addSubview(testView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

