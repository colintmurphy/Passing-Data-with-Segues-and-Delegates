//
//  ViewControllerThree.swift
//  ThreeScreenExaDataTest_ColinMurphy
//
//  Created by Colin Murphy on 9/14/20.
//  Copyright © 2020 Colin Murphy. All rights reserved.
//

import UIKit

class ViewControllerThree: UIViewController
{
    @IBOutlet weak var favoriteColorView: UIView!
    @IBOutlet weak var customButton: UIButton!
    
    var favoriteColor: UIColor?
    weak var colorDelegate: ColorDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.favoriteColorView.backgroundColor = self.favoriteColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.favoriteColorView.backgroundColor = self.favoriteColor
    }
    
    @IBAction func changeColorButton(_ sender: Any) {
        self.favoriteColor = .systemPink
        self.favoriteColorView.backgroundColor = self.favoriteColor
        
        if let color = self.favoriteColor {
            self.colorDelegate?.sendColorToFirstVC(data: color)
        }
    }
    
    func setup() {
        self.customButton.layer.cornerRadius = self.customButton.bounds.height/2
        self.favoriteColorView.layer.cornerRadius = self.favoriteColorView.bounds.height/2
        self.favoriteColorView.layer.borderWidth = 3.0
        self.favoriteColorView.layer.borderColor = UIColor.white.cgColor
    }
}
