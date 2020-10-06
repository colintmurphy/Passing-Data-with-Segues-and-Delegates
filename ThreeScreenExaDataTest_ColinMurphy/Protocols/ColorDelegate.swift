//
//  ColorDelegate.swift
//  ThreeScreenExaDataTest_ColinMurphy
//
//  Created by Colin Murphy on 9/17/20.
//  Copyright © 2020 Colin Murphy. All rights reserved.
//

import UIKit

protocol ColorDelegate: AnyObject {
    func sendColorToFirstVC(data: UIColor)
}
