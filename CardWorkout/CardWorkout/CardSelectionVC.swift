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
    @IBOutlet var startStopButton: UIButton!
    @IBOutlet var buttons: [UIButton]!
    var cards: [UIImage] = Deck.allValues
    
    var timer: Timer!
    var bShuffling: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for button in buttons {
            button.layer.cornerRadius = 8
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    
        invalidateTimer()
    }
    
    func startTimer() {
        bShuffling = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    func invalidateTimer() {
        bShuffling = false
        timer.invalidate()
    }
    
    @objc func showRandomImage() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
    // Action: What occurs when button is tapped
    @IBAction func startStopButtonTapped(_ sender: UIButton) {
        let newColor = (!bShuffling) ? UIColor.systemRed : UIColor.systemGreen
        let newTitle = (!bShuffling) ? "Stop!" : "Start!"
        
        startStopButton.backgroundColor = newColor
        startStopButton.setTitle(newTitle, for: .normal)
        startStopButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        
        if(!bShuffling) {
            startTimer()
            
        } else {
            invalidateTimer()
        }
 
    }
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        invalidateTimer()
        startTimer()
        
        startStopButton.backgroundColor = .systemRed
        startStopButton.setTitle("Stop!", for: .normal)
    }
    
    @IBAction func unwindRulesSegue(unwindSegue: UIStoryboardSegue) {
        // This already handless the dismissal of the Rules View Controller so do nothing
    }
    
}
