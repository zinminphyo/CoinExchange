//
//  CurrencyModel.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 3/9/2565 BE.
//

import Foundation


struct CurrencyModel: Codable {
    let code: String
    let symbol: String
    let rate: String
    let description: String
    let rate_float: Float?
}
