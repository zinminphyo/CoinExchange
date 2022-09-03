//
//  InAppViewController.swift
//  CoinExchange
//
//  Created by admin on 2/9/2565 BE.
//

import UIKit

class InAppViewController: UITabBarController {
    
    /// Storyboard Identifier.
    static var identifier: String {
        String(describing: Self.self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureTabbar()
    }
    

    ///  Custom Tabbar appearance.
    private func configureTabbar() {
        let shapeLayer = CAShapeLayer()
        let rect = CGRect(x: 24, y: self.tabBar.bounds.origin.y, width: self.tabBar.frame.width - 48, height: self.tabBar.frame.height + 10)
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 10).cgPath
        shapeLayer.path = path
        shapeLayer.fillColor = UIColor(named: "TabbarBackgroundColor", in: .main, compatibleWith: nil)?.cgColor
        shapeLayer.shadowPath = path
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowOffset = CGSize(width: 0, height: 3)
        shapeLayer.shadowRadius = 3
        shapeLayer.shadowOpacity = 0.5
        self.tabBar.layer.insertSublayer(shapeLayer, at: 0)
        
        self.tabBar.isTranslucent = true
        self.tabBar.backgroundImage = UIImage()
        self.tabBar.shadowImage = UIImage()
    }
    

}
