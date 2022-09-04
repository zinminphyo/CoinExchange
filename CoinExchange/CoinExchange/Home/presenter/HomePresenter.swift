//
//  HomePresenter.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 4/9/2565 BE.
//

import Foundation

class HomePresenter: HomePresenting {
    
    var view: HomeViewController?
    
    var interactor: HomeInteracting?
    
    var router: HomeRouting?
    
    func viewDidLoad() {
        
        interactor?.getCurrentPrice(completion: { result in
            switch result {
            case let .success(model):
                self.saveDataToRealm(model: model)
                self.view?.render(model: model)
            case let .failure(error):
                self.view?.render(error: error)
            }
        })
        
        
        
    }
    
    func viewDidAppear() {
        
        Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(updateCurrentPrice), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateCurrentPrice() {
        interactor?.getCurrentPrice(completion: { result in
            switch result {
            case let .success(model):
                self.saveDataToRealm(model: model)
                self.view?.render(model: model)
            case let .failure(error):
                self.view?.render(error: error)
            }
        })
    }
    
    private func saveDataToRealm(model: CurrentPriceModel) {
        var lists: [CurrencyModel] = []
        model.bpi.forEach{ lists.append($0.value) }
        DatabaseManager.shared.saveData(lists: lists, dateTime: model.time.updated)
    }
    
    
}
