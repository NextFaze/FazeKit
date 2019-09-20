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
// UIScreenAdditions.swift
// FazeKit
//
// Created by swoolcock on 16/08/2016.
//

import UIKit

public extension UIScreen {
    @nonobjc static let maxLength3_5Inch: CGFloat = 480.0
    @nonobjc static let maxLength4Inch: CGFloat = 568.0
    @nonobjc static let maxLength4_7Inch: CGFloat = 667.0
    @nonobjc static let maxLength5_5Inch: CGFloat = 736.0
    @nonobjc static let screenWidth: CGFloat = { UIScreen.main.bounds.size.width }()
    @nonobjc static let screenHeight: CGFloat = { UIScreen.main.bounds.size.height }()
    @nonobjc static let screenMaxLength: CGFloat = { max(screenWidth, screenHeight) }()
    @nonobjc static let screenMinLength: CGFloat = { min(screenWidth, screenHeight) }()
}
