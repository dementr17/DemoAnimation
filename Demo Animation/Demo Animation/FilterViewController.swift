//
//  FilterViewController.swift
//  Demo Animation
//
//  Created by Дмитрий Чепанов on 11.01.2022.
//

import UIKit

class FilterViewController: UIViewController {
    
    var delay = 0.0
    var rotate = 0.0
    var damping = 0.0
    var velocity = 0.0
    var duration = 0.0
    var repeatCount = 0.0
    
    var settingsAnimation: [Double]!
    
    var delegate: FirstViewControllerDelegate!
    
    @IBOutlet var settingsSlider: [UISlider]!

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func askSettings(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            delay = Double(settingsSlider[0].value)
        case 1:
            rotate = Double(settingsSlider[1].value)
        case 2:
            damping = Double(settingsSlider[2].value)
        case 3:
            velocity = Double(settingsSlider[3].value)
        case 4:
            duration = Double(settingsSlider[4].value)
        default:
            repeatCount = Double(settingsSlider[5].value)
        }
        
    }
    @IBAction func saveSettins(_ sender: Any) {
        settingsAnimation = [delay, rotate, damping, velocity, duration, repeatCount]
        delegate.update(settings: settingsAnimation)
    }
    
}



