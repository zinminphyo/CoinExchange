//
//  WelcomeModule.swift
//  CoinExchange
//
//  Created by admin on 2/9/2565 BE.
//

import Foundation
import UIKit

/// Welcome Module Builder For Dependency Injection.
enum WelcomeModule {
    
    static func createModule() -> WelcomeViewController {
        let st = UIStoryboard(name: "Welcome", bundle: .main)
        let vc = st.instantiateViewController(withIdentifier: WelcomeViewController.identifier) as! WelcomeViewController
        
        let router = WelcomeRouter()
        router.viewController = vc
        
        let presenter = WelcomePresenter()
        presenter.router = router
        presenter.view = vc
        
        vc.presenter = presenter
        
        return vc
    }
}
