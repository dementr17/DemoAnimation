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
    
    var settingsAnimation = [0.0, 0.0, 0.0, 0.0, 0.0]
    var delegate: FirstViewControllerDelegate!
    
    private var index = 0
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
        case 1:
            index = 1
        case 2:
            index = 2
        case 3:
            index = 3
        case 4:
            index = 4
        default:
            index = 5
        }
        slider = Double(settingsSlider[index].value)
        settingsAnimation.insert(slider, at: index)
    }
}
