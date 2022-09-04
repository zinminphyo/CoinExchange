//
//  HistoryRateViewController.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 04/09/2022.
//

import UIKit

class HistoryRateViewController: UIViewController {
    
    static var identifier: String {
        return String(describing: Self.self)
    }

    private var tableView: UITableView = {
       let tblView = UITableView()
        return tblView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
    }
    
    
    private func configureHierarchy() {
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.frame = view.bounds
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
    }
    
    

}

extension HistoryRateViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "History"
        return cell
    }
}
