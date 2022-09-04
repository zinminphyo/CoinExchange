//
//  ExchangeViewController.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 2/9/2565 BE.
//

import UIKit

class ExchangeViewController: UIViewController {
    
    @IBOutlet weak var fromCurrencyView: CurrencyView!
    @IBOutlet weak var toCurrencyView: CurrencyView!
    
    
    var model: CurrentPriceModel? = nil {
        didSet {
            fromCurrencyView.dataSource = self
            toCurrencyView.dataSource = self
        }
    }
    
    
    static var identifier: String {
        String(describing: Self.self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fromCurrencyView.dataSource = self
        toCurrencyView.dataSource = self
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            let service = GetCoinListsService()
            service.fetchCoinLists { result in
                switch result {
                case let .success(model):
                    self.model = model
                case let .failure(error):
                    print("error is \(error.localizedDescription)")
                }
            }
        }
    }
    
    
    
}

extension ExchangeViewController: ZMPDropDownViewDataSource {
    func numberOfItem(in view: ZMPDropDownView) -> Int {
        return model?.bpi.count ?? 1
    }
    func dataForItem(at index: Int) -> ZMPItem {
        guard let bpi = model?.bpi else { return EmptyItem() }
        return Array(bpi)[index].value
    }
}


extension ExchangeViewController {
    struct EmptyItem: ZMPItem {
        func getTitle() -> String {
            return "Empty"
        }
    }
}
