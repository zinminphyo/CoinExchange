//
//  HomeViewController.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 2/9/2565 BE.
//

import UIKit

class HomeViewController: UIViewController {

    static var identifier: String {
        String(describing: Self.self)
    }
    
    private var tableView: UITableView = {
        let tblView = UITableView()
        return tblView
    }()
    
    var model: CurrentPriceModel? = nil {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.frame = view.bounds
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        
        tableView.register(UINib(nibName: String(describing: CurrencyCell.self), bundle: nil), forCellReuseIdentifier: CurrencyCell.identifier)
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            let service = GetCoinListsService()
            service.fetchCoinLists { result in
                switch result {
                case let .success(model):
                    print("Model is \(model)")
                    self.model = model
                case let .failure(error):
                    print("Error is \(error.localizedDescription)")
                }
            }
        }
    }

    
}


extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.bpi.count ?? 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyCell.identifier, for: indexPath) as! CurrencyCell
        if let bpi = model?.bpi {
            cell.currencyModel = Array(bpi)[indexPath.row].value
            cell.containerView.endShimmerLoading()
        } else {
            cell.containerView.startShimmerLoading()
        }
        return cell
    }
    
    
}
