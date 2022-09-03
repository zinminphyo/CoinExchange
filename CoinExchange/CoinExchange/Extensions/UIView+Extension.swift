//
//  UIView+Extension.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 3/9/2565 BE.
//

import Foundation
import UIKit


extension UIView {
    
    var shimmerAnimationName: String {
        return "shimmerLoading"
    }
    
    func makeRoundedCorner() {
        self.layer.cornerRadius = self.frame.height / 2
    }
    
    func startShimmerLoading() {
        
        let gradientColorOne : CGColor = UIColor(white: 0.65, alpha: 1.0).cgColor
        let gradientColorTwo : CGColor = UIColor(white: 0.85, alpha: 1.0).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [gradientColorOne, gradientColorTwo, gradientColorOne]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.locations = [0,0.5,1.0]
        
        self.layer.addSublayer(gradientLayer)
        
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-1.0, -0.5, 0.0]
        animation.toValue = [1.0,1.5,2.0]
        animation.repeatCount = .infinity
        animation.duration = 0.9
        gradientLayer.add(animation, forKey: shimmerAnimationName)
         
    }
    
    
    func endShimmerLoading() {
        for eachLayer in self.layer.sublayers ?? [] {
            if eachLayer is CAGradientLayer {
                eachLayer.removeFromSuperlayer()
            }
        }
    }
}
