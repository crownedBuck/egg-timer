//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    var totalTime = 0
    var secondsPassed = 0
    
    var timer = Timer()
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func eggButtonPressed(_ sender: UIButton) {
                
        timer.invalidate()
        secondsPassed = 0
        progressBar.progress = 0.0
        
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
//        print(eggTimes[hardness]!)

        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        let percentageProgress: Float
        if secondsPassed < totalTime {
//            titleLabel.text = "\(secondsRemaining) seconds remaining."
            
            percentageProgress = Float(secondsPassed) / Float(totalTime)
            
            progressBar.progress = percentageProgress
            
            print("\(secondsPassed) seconds.")
            secondsPassed += 1
        } else  {
            timer.invalidate()
            titleLabel.text = "DONE!"
            progressBar.progress = 1.0
        }
    }

}
