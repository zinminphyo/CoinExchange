//
//  HomePresenting.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 4/9/2565 BE.
//

import Foundation


protocol HomePresenting {
    var view: HomeViewController? { get set }
    var interactor: HomeInteracting? { get set }
    var router: HomeRouting? { get set }
    func viewDidLoad()
    func viewDidAppear()
}
