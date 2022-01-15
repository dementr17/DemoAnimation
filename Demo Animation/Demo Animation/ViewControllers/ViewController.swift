//
//  ViewController.swift
//  Demo Animation
//
//  Created by Дмитрий Чепанов on 11.01.2022.
//

import Spring

protocol FirstViewControllerDelegate {
    func update(settings: Animation)
}

class ViewController: UIViewController {
    
    @IBOutlet weak var viewAnimation: SpringView!
    
    @IBOutlet weak var nameAnimation: UILabel!

    private var animation = Animation.getRandomAnimation()
    private var curve: String!
    
//    private var settingsAnimation: [String: Double]!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? FilterViewController else { return }
        destination.delegate = self
    }
    
    @IBAction func changeAnimation(_ sender: SpringButton) {
        parametersAnimation()
        
        nameAnimation.text = "Animation: \(animation.description)"
        
        viewAnimation.animate()
        
        animation = Animation.getRandomAnimation()
        curve = animation.curve
        sender.setTitle("\(animation.name)", for: .normal)
        
        sender.animation = "squeeze"
        sender.animate()
        
    }
    
}

extension ViewController {
    private func parametersAnimation() {
        if animation != nil {
            viewAnimation.delay = animation.delay
            viewAnimation.rotate = animation.rotate
            viewAnimation.damping = animation.damping
            viewAnimation.velocity = animation.velocity
            viewAnimation.repeatCount = animation.repeatCount
            viewAnimation.duration = animation.duration
        }
    }
    
    
}

extension ViewController: FirstViewControllerDelegate {
    func update(settings: Animation) {
        animation = settings
    } 
}
