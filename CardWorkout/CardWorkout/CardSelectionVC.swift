//
//  CardSelectionVC.swift
//  CardWorkout
//
//  Created by Marco Capraro on 1/29/24.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    // Make sure Outlets have strong references (RECOMMENDED)
    // Outlets: What gives you access to the object in code to make changes
    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for button in buttons {
            button.layer.cornerRadius = 8
        }


    }
    
    // Action: What occurs when button is tapped
    @IBAction func stopButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func rulesButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func unwindRulesSegue(unwindSegue: UIStoryboardSegue) {
        // Do nothing but dismiss rules VC
    }
    
}
