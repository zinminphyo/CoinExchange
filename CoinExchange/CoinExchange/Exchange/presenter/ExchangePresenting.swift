//
//  ExchangePresenting.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 04/09/2022.
//

import Foundation


protocol ExchangePresenting {
    var view: ExchangeViewControlling? { get set }
    var interactor: ExchangeInteracting? { get set } 
    func viewDidLoad()
    func viewWillAppear()
}
