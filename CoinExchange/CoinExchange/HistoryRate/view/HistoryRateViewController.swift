//
//  HistoryRateViewController.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 04/09/2022.
//

import UIKit

class HistoryRateViewController: UIViewController, MessagePresentable {
    
    static var identifier: String {
        return String(describing: Self.self)
    }

    private var tableView: UITableView = {
       let tblView = UITableView()
        return tblView
    }()
    
    private var historyLists: [HistoryRateObject] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var presenter: HistoryRatePresenting?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        
        presenter?.viewDidLoad()
        
        print("Table view frame is \(tableView.frame)")
        
    }
    
    
    private func configureHierarchy() {
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.frame = view.bounds
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        view.addSubview(tableView)
        tableView.register(UINib(nibName: String(describing: HistoryRateTableViewCell.self), bundle: nil), forCellReuseIdentifier: HistoryRateTableViewCell.reuseIdentifier)
        tableView.dataSource = self
    }
    

}

// MARK: - UITable View Data Source.
extension HistoryRateViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyLists.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryRateTableViewCell.reuseIdentifier, for: indexPath) as! HistoryRateTableViewCell
        cell.historyRate = historyLists[indexPath.row]
        return cell
    }
}



// MARK: - HistoryRate View Controlling Conformance.
extension HistoryRateViewController: HistoryRateViewControlling {
    
    func render(historyLists: [HistoryRateObject]) {
        self.historyLists = historyLists
    }
    
    func render(error: String) {
        present(error)
    }
}
