//
//  CurrentPriceModel.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 3/9/2565 BE.
//

import Foundation


struct CurrentPriceModel: Codable {
    let bpi: [String:CurrencyModel]
}
