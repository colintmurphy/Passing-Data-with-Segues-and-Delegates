//
//  ViewControllerTwo.swift
//  ThreeScreenExaDataTest_ColinMurphy
//
//  Created by Colin Murphy on 9/14/20.
//  Copyright © 2020 Colin Murphy. All rights reserved.
//

import UIKit

class ViewControllerTwo: UIViewController {
    
    // MARK: - @IBOutlets
    
    @IBOutlet private weak var favoriteColorView: UIView!
    @IBOutlet private weak var customButton: UIButton!
    
    // MARK: - Variables
    
    var favoriteColor: UIColor?
    weak var colorDelegate: ColorDelegate?
    
    // MARK: - View Life Cycles
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        self.favoriteColorView.backgroundColor = self.favoriteColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        self.favoriteColorView.backgroundColor = self.favoriteColor
    }
    
    // MARK: - IBActions
    
    @IBAction private func changeColorButton(_ sender: Any) {
        
        self.favoriteColor = .systemTeal
        self.favoriteColorView.backgroundColor = self.favoriteColor
        
        if let color = self.favoriteColor {
            self.colorDelegate?.sendColorToFirstVC(data: color)
        }
    }
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toScreenThree" {
            if let screen3 = segue.destination as? ViewControllerThree {
                
                screen3.favoriteColor = self.favoriteColor
                screen3.colorDelegate = self.colorDelegate
            }
        }
    }
    
    // MARK: - Setup
    
    private func setup() {
        
        self.customButton.layer.cornerRadius = self.customButton.bounds.height / 2
        self.favoriteColorView.layer.cornerRadius = self.favoriteColorView.bounds.height / 2
        self.favoriteColorView.layer.borderWidth = 3.0
        self.favoriteColorView.layer.borderColor = UIColor.white.cgColor
    }
}
