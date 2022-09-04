//
//  ExchangePresenter.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 04/09/2022.
//

import Foundation



class ExchangePresenter: ExchangePresenting {
    
    var view: ExchangeViewControlling?
    
    var interactor: ExchangeInteracting?
    
    func viewDidLoad() {
        
    }
    
    func viewWillAppear() {
        interactor?.getCurrencyLists(completion: { result in
            switch result {
            case let .success(model):
                var currentLists: [CurrencyModel] = []
                model.bpi.forEach{ currentLists.append($0.value) }
                self.view?.render(lists: currentLists)
            case let .failure(error):
                self.view?.render(error: error)
            }
        })
    }
    
    
}
