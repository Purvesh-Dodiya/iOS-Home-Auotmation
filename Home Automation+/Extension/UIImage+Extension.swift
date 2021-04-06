//
//  UIImage+Extension.swift
//  Home Automation+
//
//  Created by Purvesh Dodiye on 06/04/21.
//

import UIKit

extension UIImageView {
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 0.5
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
    
    func lightAnimation() {
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        animation.fromValue = 0.2
        animation.toValue = 1.0
        animation.duration = 0.5
        animation.autoreverses = true
        animation.repeatCount = Float.greatestFiniteMagnitude
        self.layer.add(animation, forKey: "fade")
    }
    
    func acAnimation () {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: 20)
        rotation.fromValue = NSNumber(value: -20)
        rotation.duration = 0.5
        rotation.autoreverses = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.layer.add(rotation, forKey: "acAnimation")
    }
}
