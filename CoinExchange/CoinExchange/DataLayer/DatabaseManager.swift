//
//  DatabaseManager.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 04/09/2022.
//

import Foundation
import RealmSwift


class DatabaseManager {
    
    static let shared = DatabaseManager()
    private init() {}
    
    private let realm = try! Realm()
    
    func saveData(lists: [CurrencyModel], dateTime: String) {
        try! realm.write{
            let historyRate = HistoryRateObject()
            historyRate.dateTime = dateTime
            for each in lists {
                switch Utils.shared.getCurrenyType(for: each.code) {
                case .USD:
                    historyRate.USD_PRICE = each.rate_float ?? 0.0
                case .EUR:
                    historyRate.EUR_PRICE = each.rate_float ?? 0.0
                case .GBP:
                    historyRate.GBP_PRICE = each.rate_float ?? 0.0
                default: break
                }
            }
            realm.add(historyRate)
        }
    }
    
    func getData() -> [HistoryRateObject] {
        let result = realm.objects(HistoryRateObject.self)
        return Array(result)
    }
    
    
}
