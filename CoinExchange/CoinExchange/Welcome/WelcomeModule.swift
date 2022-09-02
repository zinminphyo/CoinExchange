//
//  WelcomeModule.swift
//  CoinExchange
//
//  Created by admin on 2/9/2565 BE.
//

import Foundation
import UIKit


enum WelcomeModule {
    static func createModule() -> WelcomeViewController {
        let st = UIStoryboard(name: "Welcome", bundle: .main)
        let vc = st.instantiateViewController(withIdentifier: WelcomeViewController.identifier) as! WelcomeViewController
        return vc
    }
}
