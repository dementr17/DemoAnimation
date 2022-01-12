//
//  ViewController.swift
//  Demo Animation
//
//  Created by Дмитрий Чепанов on 11.01.2022.
//

import Spring

protocol FirstViewControllerDelegate {
    func update(settings: [String: Double])
}

class ViewController: UIViewController {
    
    @IBOutlet weak var viewAnimation: SpringView!
    
    @IBOutlet weak var nameAnimation: UILabel!
    @IBOutlet weak var curveAnimation: UILabel!
    @IBOutlet weak var velocityAnimation: UILabel!
    @IBOutlet weak var durationAnimation: UILabel!
    @IBOutlet weak var repeatAnimation: UILabel!

    private var animation = Animation.slideLeft
    private var curve = AnimationCurve.easeIn
    
    private var settingsAnimation: [String: Double]!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? FilterViewController else { return }
        destination.delegate = self
    }
    
    @IBAction func changeAnimation(_ sender: SpringButton) {
        storeAnimations()
        animationCurve()
        parametersAnimation()
        
        nameAnimation.text = "Animation: \(animation)"
        curveAnimation.text = "Curve: \(curve)"
        velocityAnimation.text = "Velocity: \(String(format: "%.2f", viewAnimation.velocity))"
        durationAnimation.text = "Duration: \(String(format: "%.2f", viewAnimation.duration))"
        repeatAnimation.text = "RepeatCount: \(String(format: "%.2f", viewAnimation.repeatCount))"
        
        viewAnimation.animate()
        
        animation = Animation.random()
        curve = AnimationCurve.random()
        sender.setTitle("\(animation)", for: .normal)
        
        sender.animation = "squeeze"
        sender.animate()
        
    }
    
}

extension ViewController {
    private func parametersAnimation() {
        if settingsAnimation != nil {
        viewAnimation.delay = settingsAnimation["delay"]!
        viewAnimation.rotate = settingsAnimation["rotate"]!
        viewAnimation.damping = settingsAnimation["damping"]!
        viewAnimation.velocity = settingsAnimation["velocity"]!
        viewAnimation.repeatCount = Float(settingsAnimation["repeat"]!)
        viewAnimation.duration = settingsAnimation["duration"]!
        }
    }
    
    private func storeAnimations() {
        switch animation {
        case .slideLeft:
            viewAnimation.animation = "slideLeft"
        case .slideRight:
            viewAnimation.animation = "slideRight"
        case .slideDown:
            viewAnimation.animation = "slideDown"
        case .slideUp:
            viewAnimation.animation = "slideUp"
        case .squeezeLeft:
            viewAnimation.animation = "squeezeLeft"
        case .squeezeRight:
            viewAnimation.animation = "squeezeRight"
        case .squeezeDown:
            viewAnimation.animation = "squeezeDown"
        case .squeezeUp:
            viewAnimation.animation = "squeezeUp"
        case .fadeIn:
            viewAnimation.animation = "fadeIn"
        case .fadeOut:
            viewAnimation.animation = "fadeOut"
        case .fadeOutIn:
            viewAnimation.animation = "fadeOutIn"
        case .fadeInLeft:
            viewAnimation.animation = "fadeInLeft"
        case .fadeInRight:
            viewAnimation.animation = "fadeInRight"
        case .fadeInDown:
            viewAnimation.animation = "fadeInDown"
        case .fadeInUp:
            viewAnimation.animation = "fadeInUp"
        case .zoomIn:
            viewAnimation.animation = "zoomIn"
        case .zoomOut:
            viewAnimation.animation = "zoomOut"
        case .fall:
            viewAnimation.animation = "fall"
        case .shake:
            viewAnimation.animation = "shake"
        case .pop:
            viewAnimation.animation = "pop"
        case .flipX:
            viewAnimation.animation = "flipX"
        case .flipY:
            viewAnimation.animation = "flipY"
        case .morph:
            viewAnimation.animation = "morph"
        case .squeeze:
            viewAnimation.animation = "squeeze"
        case .flash:
            viewAnimation.animation = "flash"
        case .wobble:
            viewAnimation.animation = "wobble"
        case .swing:
            viewAnimation.animation = "swing"
        }
    }
    
    private func animationCurve() {
        switch curve {
        case .easeIn:
            viewAnimation.curve = "easeIn"
        case .easeOut:
            viewAnimation.curve = "easeOut"
        case .easeInOut:
            viewAnimation.curve = "easyInOut"
        case .linear:
            viewAnimation.curve = "linear"
        case .spring:
            viewAnimation.curve = "spring"
        case .easeInSine:
            viewAnimation.curve = "easeInSine"
        case .easeOutSine:
            viewAnimation.curve = "easeOutSine"
        case .easeInOutSine:
            viewAnimation.curve = "easeInOutSine"
        case .easeInQuad:
            viewAnimation.curve = "easeInQuad"
        case .easeOutQuad:
            viewAnimation.curve = "easeOutQuad"
        case .easeInOutQuad:
            viewAnimation.curve = "easeInOutQuad"
        case .easeInCubic:
            viewAnimation.curve = "easeInCubic"
        case .easeOutCubic:
            viewAnimation.curve = "easeOutCubic"
        case .easeInOutCubic:
            viewAnimation.curve = "easeInOutCubic"
        case .easeInQuart:
            viewAnimation.curve = "easeInQuart"
        case .easeOutQuart:
            viewAnimation.curve = "easeOutQuart"
        case .easeInOutQuart:
            viewAnimation.curve = "easeInOutQuart"
        case .easeInQuint:
            viewAnimation.curve = "easeInQuint"
        case .easeOutQuint:
            viewAnimation.curve = "easeOutQuint"
        case .easeInOutQuint:
            viewAnimation.curve = "easeInOutQuint"
        case .easeInExpo:
            viewAnimation.curve = "easeInExpo"
        case .easeOutExpo:
            viewAnimation.curve = "easeOutExpo"
        case .easeInOutExpo:
            viewAnimation.curve = "easeOutExpo"
        case .easeInCirc:
            viewAnimation.curve = "easeInCirc"
        case .easeOutCirc:
            viewAnimation.curve = "easeOutCirc"
        case .easeInOutCirc:
            viewAnimation.curve = "easeInOutCirc"
        case .easeInBack:
            viewAnimation.curve = "easeInBack"
        case .easeOutBack:
            viewAnimation.curve = "easeOutBack"
        case .easeInOutBack:
            viewAnimation.curve = "easeInOutBack"
        }
    }
}

extension ViewController: FirstViewControllerDelegate {
    func update(settings: [String: Double]) {
        settingsAnimation = settings
    } 
}
