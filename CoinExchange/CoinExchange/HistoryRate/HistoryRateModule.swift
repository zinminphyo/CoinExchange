//
//  HistoryRateModule.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 04/09/2022.
//

import Foundation
import UIKit


enum HistoryRateModule {
    static func createModule() -> UIViewController {
        let st = UIStoryboard(name: "HistoryRate", bundle: .main)
        let vc = st.instantiateViewController(withIdentifier: HistoryRateViewController.identifier) as! HistoryRateViewController
        
        let presenter = HistoryRatePresenter()
        vc.presenter = presenter
        
        presenter.view = vc
        return vc
    }
}
