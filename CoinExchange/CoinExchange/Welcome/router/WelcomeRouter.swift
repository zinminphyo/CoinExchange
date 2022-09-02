//
//  WelcomeRouter.swift
//  CoinExchange
//
//  Created by admin on 3/9/2565 BE.
//

import Foundation
import UIKit

class WelcomeRouter: WelcomeRouting {
    
    var viewController: UIViewController?
    
    func routeToInAppVC() {
        let InAppVC = InAppModule.createModule()
        InAppVC.modalPresentationStyle = .fullScreen
        viewController?.present(InAppVC, animated: true)
    }
    
    
}
