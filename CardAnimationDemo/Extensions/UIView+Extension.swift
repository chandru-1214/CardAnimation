//
//  UIView+Extensio.swift
//  AnimationDemo
//
//  Created by Chandru on 09/09/23.
//

import UIKit

extension UIView {
    
    var globalFrame: CGRect {
        return convert(bounds, to: window)
    }
    
    func setCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func setCirculerView() {
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
    }
    
    /// Method to implement view blink animation
    func flash() {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.7
        flash.fromValue = 1
        flash.toValue = 0.8
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = .infinity
        layer.add(flash, forKey: "blink")
    }
    
}
