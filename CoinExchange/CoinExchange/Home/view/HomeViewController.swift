//
//  HomeViewController.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 2/9/2565 BE.
//

import UIKit

class HomeViewController: UIViewController, MessagePresentable {

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
    
    var presenter: HomePresenting?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dependencyInjection()
        configureHierarchy()
        
        presenter?.viewDidLoad()

    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter?.viewDidAppear()
    }

    
}


extension HomeViewController {
    
    private func configureHierarchy() {
        configureTableView()
        configureRightBarItem()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
        ])
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UINib(nibName: String(describing: CurrencyCell.self), bundle: nil), forCellReuseIdentifier: CurrencyCell.identifier)
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func configureRightBarItem() {
        let historyBtn = UIBarButtonItem(image: Images.HISTORY_LOGO, style: .plain, target: self, action: #selector(didTapHistoryBtn))
        historyBtn.tintColor = .black
        self.navigationItem.rightBarButtonItem = historyBtn
    }
    
    @objc func didTapHistoryBtn() {
        self.navigationController?.pushViewController(HistoryRateModule.createModule(), animated: true)
    }
    
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.bpi.count ?? 13
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyCell.identifier, for: indexPath) as! CurrencyCell
        if let bpi = model?.bpi {
            cell.currencyModel = Array(bpi)[indexPath.row].value
            cell.containerView.endShimmerLoading()
        } else {
            cell.containerView.startShimmerLoading()
        }
        cell.selectionStyle = .none
        return cell
    }
    
    
}


extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


extension HomeViewController: HomeViewControlling {
    
    func render(model: CurrentPriceModel) {
        self.model = model
    }
    
    func render(error: NetworkError) {
        present(error.localizedDescription)
    }
    
    
}

extension HomeViewController {
    private func dependencyInjection() {
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        
        presenter.view = self
        presenter.interactor = interactor
        presenter.router = router
        router.viewController = self
        
        self.presenter = presenter
    }
}
