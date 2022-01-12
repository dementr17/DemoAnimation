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
    @IBOutlet var settingsLabel: [UILabel]!
    
    var settingsAnimation = ["delay": 0.5,
                             "rotate": 180.0,
                             "damping": 1.5,
                             "velocity": 50.0,
                             "duration": 1.5,
                             "repeat": 5.0]
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
        settingsLabel[index].text = String(format: "%.1f", settingsSlider[index].value)
    }
}
