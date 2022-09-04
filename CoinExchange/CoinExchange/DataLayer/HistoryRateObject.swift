//
//  HistoryRateObject.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 04/09/2022.
//

import Foundation
import RealmSwift


class HistoryRateObject: Object {
    @Persisted var dateTime: String = ""
    @Persisted var USD_PRICE: Float = 0.0
    @Persisted var EUR_PRICE: Float = 0.0
    @Persisted var GBP_PRICE: Float = 0.0
}
