//
//  InAppModule.swift
//  CoinExchange
//
//  Created by admin on 2/9/2565 BE.
//

import Foundation
import UIKit


enum InAppModule {
    static func createModule() -> UIViewController {
        let st = UIStoryboard(name: "InApp", bundle: .main)
        let vc = st.instantiateViewController(withIdentifier: InAppViewController.identifier) as! InAppViewController
        vc.modalPresentationStyle = .fullScreen
        return vc
    }
}
