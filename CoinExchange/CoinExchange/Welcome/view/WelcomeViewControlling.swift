//
//  WelcomeViewControlling.swift
//  CoinExchange
//
//  Created by admin on 3/9/2565 BE.
//

import Foundation


protocol WelcomeViewControlling {
    var presenter: WelcomePresenting? { get set }
    func renderWelcomeImageAnimation()
    func renderWelcomeGreetingLabelAnimation()
}
