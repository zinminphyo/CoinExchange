//
//  ExchangeViewControlling.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 04/09/2022.
//

import Foundation
import UIKit


protocol ExchangeViewControlling {
    var presenter: ExchangePresenting? { get set }
    func render(lists: [CurrencyModel])
    func render(error: NetworkError)
}
