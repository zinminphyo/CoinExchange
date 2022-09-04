//
//  ExchangeViewController.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 2/9/2565 BE.
//

import UIKit

class ExchangeViewController: UIViewController, MessagePresentable {
    
    @IBOutlet weak var fromCurrencyContainerView: UIView!
    @IBOutlet weak var fromCurrencyView: CurrencyView!
    @IBOutlet weak var fromCurrenyTxtField: ZMPTextField!
    @IBOutlet weak var toCurrencyTxtField: ZMPTextField!
    @IBOutlet weak var containerViewCenterYConstraint: NSLayoutConstraint!
    
    /// Reactive Currency Lists.
    var currencyLists: [CurrencyModel] = [] {
        didSet {
            fromCurrencyView.dataSource = self
            fromCurrencyContainerView.endShimmerLoading()
        }
    }
  
    ///  Reactive Currency Model.
    private var fromCurrencyModel: CurrencyModel! = nil {
        didSet {
            bindToCurrencyView(currencyModel: fromCurrencyModel)
        }
    }
    
    
    var presenter: ExchangePresenting?
    
    static var identifier: String {
        String(describing: Self.self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        injectDependency()
        
        fromCurrencyView.dataSource = self
        fromCurrencyView.delegate = self
        
        fromCurrenyTxtField.addTarget(self, action: #selector(didChangeCurrency(textField:)), for: .editingChanged)
        
 
        configureHierarchy()
        fromCurrencyContainerView.startShimmerLoading()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardNotification(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardNotification(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }
    
    
    
    
}

// MARK: - Helper Functions.
extension ExchangeViewController {
    
    private func configureHierarchy() {
        configureGesture()
    }
    
    private func configureGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapGesture() {
        self.view.endEditing(true)
    }
    
    @objc func didChangeCurrency(textField: UITextField) {
        let value = Float(textField.text ?? "0.0") ?? 0.0
        toCurrencyTxtField.text = "\(convertCurrency(value: value))"
    }
    
    @objc func keyboardNotification(_ notification: Notification) {
        if notification.name == UIResponder.keyboardWillShowNotification {
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
                self.containerViewCenterYConstraint.constant = -100
            }, completion: nil)
        } else if notification.name == UIResponder.keyboardWillHideNotification {
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
                self.containerViewCenterYConstraint.constant = 0
            }, completion: nil)
        }
    }
}


// MARK: - View Controlling Conformance
extension ExchangeViewController: ExchangeViewControlling {
    
    func render(lists: [CurrencyModel]) {
        self.currencyLists = lists
        guard let defaultValue = lists.first else { return }
        fromCurrencyModel = defaultValue
    }
    
    func render(error: NetworkError) {
        self.present(error.localizedDescription)
    }
}


// MARK: - Dependency Injection.
extension ExchangeViewController {
    private func injectDependency() {
        let presenter = ExchangePresenter()
        let interactor = ExchangeInteractor()
        
        self.presenter = presenter
        presenter.view = self
        presenter.interactor = interactor
    }
}

// MARK: - ZMPDropDown View DataSource and Delegate conformance.
extension ExchangeViewController: ZMPDropDownViewDataSource {
    func numberOfItem(in view: ZMPDropDownView) -> Int {
        return currencyLists.count
    }
    func dataForItem(at index: Int) -> ZMPItem {
        return currencyLists[index]
    }
}

extension ExchangeViewController: ZMPDropDownViewDelegate {
    func didSelectItem(at indexPath: Int, in view: ZMPDropDownView) {
        fromCurrencyModel = currencyLists[indexPath]
    }
    
    private func bindToCurrencyView(currencyModel: CurrencyModel) {
        fromCurrencyView.currencyNameLabel.text = currencyModel.code
        fromCurrencyView.currencyImageView.image = Utils.shared.getImage(for: Utils.shared.getCurrenyType(for: currencyModel.code))
    }
}



extension ExchangeViewController {
    private func convertCurrency(value: Float) -> Float {
        let rate = fromCurrencyModel.rate_float ?? 0.0
        return value / rate
    }
}

