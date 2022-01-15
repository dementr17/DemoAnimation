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
    
//    var settingsAnimation = ["delay": 0.5,
//                             "rotate": 180.0,
//                             "damping": 1.5,
//                             "velocity": 50.0,
//                             "duration": 1.5,
//                             "repeat": 5.0]
    var settingsAnimation = Animation.getRandomAnimation()
    
    var delegate: FirstViewControllerDelegate!
    
    private var keys: Double!
    private var index: Int!
    private var slider: Double!
    
    @IBAction func askSettings(_ sender: UISlider) {
        settingsSlider(sender: sender)
    }
    
    @IBAction func saveSettins(_ sender: Any) {
        delegate.update(settings: settingsAnimation)
//        routeToView()
    }

}

extension FilterViewController {
    private func settingsSlider(sender: UISlider) {
        switch sender.tag {
        case 0:
            index = 0
            settingsAnimation.delay = Double(settingsSlider[index].value)
        case 1:
            index = 1
            settingsAnimation.rotate = Double(settingsSlider[index].value)
        case 2:
            index = 2
            settingsAnimation.damping = Double(settingsSlider[index].value)
        case 3:
            index = 3
            settingsAnimation.velocity = Double(settingsSlider[index].value)
        case 4:
            index = 4
            settingsAnimation.duration = Double(settingsSlider[index].value)
        default:
            index = 5
            settingsAnimation.repeatCount = Float(settingsSlider[index].value)
        }
        
  
        settingsLabel[index].text = String(format: "%.1f", settingsSlider[index].value)
    }
    
//    func routeToView() {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController =  storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        navigationController?.pushViewController(viewController, animated: true)
//    }
}
