//
//  HomeViewControlling.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 4/9/2565 BE.
//

import Foundation


protocol HomeViewControlling {
    var presenter: HomePresenting? { get set } 
    func render(model: CurrentPriceModel)
    func render(error: NetworkError)
}
