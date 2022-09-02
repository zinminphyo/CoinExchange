//
//  WelcomePresenting.swift
//  CoinExchange
//
//  Created by admin on 3/9/2565 BE.
//

import Foundation


protocol WelcomePresenting {
    var view: WelcomeViewControlling? { get set }
    var router: WelcomeRouting? { get set }
    func viewDidLoad()
    func viewDidAppear()
    func didFinishedWelcomeAnimation()
}
