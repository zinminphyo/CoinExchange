//
//  Utils.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 04/09/2022.
//

import Foundation
import UIKit


class Utils {
    
    static let shared = Utils()
    
    private init() {}
    
    
    func getCurrenyType(for name: String) -> CurrencyType {
        switch name {
        case "USD":
            return .USD
        case "EUR":
            return .EUR
        case "GBP":
            return .GBP
        default:
            return .UNKNOWN
        }
    }
    
    func getImage(for type: CurrencyType) -> UIImage? {
        switch type {
        case .USD:
            return Images.USD_LOGO
        case .EUR:
            return Images.EUR_LOGO
        case .GBP:
            return Images.GBP_LOGO
        case .UNKNOWN:
            return nil
        }
    }
    
    func getCurrencySign(for type: CurrencyType) -> String {
        switch type {
        case .USD:
            return "$ "
        case .EUR:
            return "€ "
        case .GBP:
            return "£ "
        case .UNKNOWN:
            return ""
        }
    }
    
    
}
