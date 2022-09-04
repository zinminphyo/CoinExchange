//
//  HistoryRateViewControlling.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 04/09/2022.
//

import Foundation


protocol HistoryRateViewControlling {
    var presenter: HistoryRatePresenting? { get set }
    func render(historyLists: [HistoryRateObject])
    func render(error: String)
}
