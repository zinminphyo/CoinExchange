//
//  HomeViewController.swift
//  CoinExchange
//
//  Created by admin on 2/9/2565 BE.
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
    
    var model: CurrentPriceModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.frame = view.bounds
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        
        
        let service = GetCoinListsService()
        service.fetchCoinLists()
    }

    
    
}


extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.bpi.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = Array(model?.bpi ?? [:])[indexPath.row].key
        return cell
    }
    
    
}
