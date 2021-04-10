//
//  UIImage+Extension.swift
//  Home Automation+
//
//  Created by Purvesh Dodiye on 06/04/21.
//

import UIKit


extension UIImageView {
    func fanAnimation() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 0.5
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.image = UIImage(named: "fan")
        self.layer.add(rotation, forKey: "rotationAnimation")
        
    }
    
    func fanAnimationStop() {
        self.layer.removeAllAnimations()
        self.image = UIImage(named: "fan")
    }
    
    func lightAnimation() {
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        animation.fromValue = 0.2
        animation.toValue = 1.0
        animation.duration = 0.5
        animation.autoreverses = true
        animation.repeatCount = Float.greatestFiniteMagnitude
        self.image = UIImage(named: "light_on")
        self.layer.add(animation, forKey: "fade")
    }
    func lightAnimationStop() {
        self.layer.removeAllAnimations()
        self.image = UIImage(named: "light_off")
    }
    func acAnimation () {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi/9)
        rotation.fromValue = NSNumber(value: -Double.pi/9)
        rotation.duration = 0.5
        rotation.autoreverses = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.image = UIImage(named: "ac_on")
        self.layer.add(rotation, forKey: "acAnimation")
    }
    func acAnimationStop() {
        self.layer.removeAllAnimations()
        self.image = UIImage(named: "ac_off")
    }
    
    func tvAnimation () {
        let rotation = CABasicAnimation(keyPath: "transform.scale")
        rotation.toValue = NSNumber(value: 1)
        rotation.fromValue = NSNumber(value: 0.5)
        rotation.duration = 0.5
        rotation.autoreverses = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.image = UIImage(named: "tv_on")
        self.layer.add(rotation, forKey: "tvAnimation")
    }
    func tvAnimationStop() {
        self.layer.removeAllAnimations()
        self.image = UIImage(named: "tv_off")
    }
}
