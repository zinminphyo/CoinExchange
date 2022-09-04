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

// MARK: - UITable View Data Source.
extension HistoryRateViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyLists.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = historyLists[indexPath.row].dateTime
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
