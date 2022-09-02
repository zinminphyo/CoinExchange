//
//  WelcomeRouting.swift
//  CoinExchange
//
//  Created by admin on 3/9/2565 BE.
//

import Foundation
import UIKit

protocol WelcomeRouting {
    var viewController: UIViewController? { get set }
    func routeToInAppVC()
}
