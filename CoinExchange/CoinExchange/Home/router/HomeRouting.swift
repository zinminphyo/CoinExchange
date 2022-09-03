//
//  HomeRouting.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 4/9/2565 BE.
//

import Foundation
import UIKit


protocol HomeRouting {
    var viewController: UIViewController? { get set }
    func routeToExchangeVC()
}
