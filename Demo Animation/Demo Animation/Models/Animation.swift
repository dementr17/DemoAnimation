//
//  ModelAnimation.swift
//  Demo Animation
//
//  Created by Дмитрий Чепанов on 13.01.2022.
//

import Foundation

struct Animation {
    
    let name: String
    let curve: String
    let force: Double
    var duration: Double
    var delay: Double
    var rotate: Double
    var damping: Double
    var velocity: Double
    var repeatCount: Float

    var description: String {
         """
         Animation: \(name)
         Curve: \(curve)
         Force: \(String(format: "%.2f", force))
         Duration: \(String(format: "%.2f", duration))
         Delay: \(String(format: "%.2f", delay))
         """
    }
 
    static func getRandomAnimation() -> Animation {
        Animation(
            name: DataManager.shared.springs.randomElement()?.rawValue ?? "wobble",
            curve: DataManager.shared.springs.randomElement()?.rawValue ?? "easeIn",
            force: Double.random(in: 0...3),
            duration: Double.random(in: 0...2),
            delay: Double.random(in: 0...3),
            rotate: Double.random(in: 0...360),
            damping: Double.random(in: 0...3),
            velocity: Double.random(in: 0...4),
            repeatCount: Float.random(in: 0...5)
        )
    }
}
    
