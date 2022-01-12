//
//  FilterViewController.swift
//  Demo Animation
//
//  Created by Дмитрий Чепанов on 11.01.2022.
//

import UIKit
import Spring

class FilterViewController: UIViewController {

    @IBOutlet var settingsSlider: [UISlider]!
    
    var settingsAnimation = ["delay": 0.0,
                             "rotate": 0.0,
                             "damping": 0.0,
                             "velocity": 0.0,
                             "duration": 0.0,
                             "repeat": 0.0]
    var delegate: FirstViewControllerDelegate!
    
    private var keys: String!
    private var index: Int!
    private var slider: Double!
    
    @IBAction func askSettings(_ sender: UISlider) {
        settingsSlider(sender: sender)
    }
    
    @IBAction func saveSettins(_ sender: Any) {
        delegate.update(settings: settingsAnimation)
    }
    
}

extension FilterViewController {
    private func settingsSlider(sender: UISlider) {
        switch sender.tag {
        case 0:
            index = 0
            keys = "delay"
        case 1:
            index = 1
            keys = "rotate"
        case 2:
            index = 2
            keys = "damping"
        case 3:
            index = 3
            keys = "velocity"
        case 4:
            index = 4
            keys = "duration"
        default:
            index = 5
            keys = "repeat"
        }
        
        settingsAnimation[keys] = Double(settingsSlider[index].value)
    }
}
