//
//  HistoryRatePresenter.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 04/09/2022.
//

import Foundation


class HistoryRatePresenter: HistoryRatePresenting {
    
    var view: HistoryRateViewControlling?
    
    func viewDidLoad() {
        let historyLists = DatabaseManager.shared.getData()
        self.view?.render(historyLists: historyLists)
    }
    
    
}
