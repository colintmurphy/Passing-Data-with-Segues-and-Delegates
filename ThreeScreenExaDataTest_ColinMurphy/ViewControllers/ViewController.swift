//
//  ViewController.swift
//  ThreeScreenExaDataTest_ColinMurphy
//
//  Created by Colin Murphy on 9/14/20.
//  Copyright © 2020 Colin Murphy. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var favoriteColorView: UIView!
    @IBOutlet weak var customButton: UIButton!
    
    var favoriteColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.favoriteColorView.backgroundColor = self.favoriteColor
    }

    @IBAction func changeColorButton(_ sender: Any) {
        self.favoriteColor = .systemGreen
        self.favoriteColorView.backgroundColor = self.favoriteColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toScreenTwo" {
            if let screen2 = segue.destination as? ViewControllerTwo {
                screen2.favoriteColor = self.favoriteColor
                screen2.colorDelegate = self
            }
        }
    }
    
    func setup() {
        self.favoriteColor = .white
        self.customButton.layer.cornerRadius = self.customButton.bounds.height/2
        self.favoriteColorView.layer.cornerRadius = self.favoriteColorView.bounds.height/2
        self.favoriteColorView.layer.borderWidth = 3.0
        self.favoriteColorView.layer.borderColor = UIColor.white.cgColor
    }
}

extension ViewController: ColorDelegate {
    func sendColorToFirstVC(data: UIColor) {
        self.favoriteColor = data
    }
}
