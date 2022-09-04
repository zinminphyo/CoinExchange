//
//  HistoryRatePresenting.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 04/09/2022.
//

import Foundation


protocol HistoryRatePresenting {
    var view: HistoryRateViewControlling? { get set }
    func viewDidLoad()
}
