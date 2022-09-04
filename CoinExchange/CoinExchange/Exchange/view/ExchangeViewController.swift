//
//  ExchangeViewController.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 2/9/2565 BE.
//

import UIKit

class ExchangeViewController: UIViewController {
    
    @IBOutlet weak var fromCurrencyView: CurrencyView!
    @IBOutlet weak var fromCurrenyTxtField: ZMPTextField!
    @IBOutlet weak var toCurrencyTxtField: ZMPTextField!
    @IBOutlet weak var containerViewCenterYConstraint: NSLayoutConstraint!
    
    
    var currencyLists: [CurrencyModel] = [] {
        didSet {
            fromCurrencyView.dataSource = self
        }
    }
    
    private var fromCurrencyModel: CurrencyModel! = nil
    
    
    static var identifier: String {
        String(describing: Self.self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fromCurrencyView.dataSource = self
        fromCurrencyView.delegate = self
        
        fromCurrenyTxtField.addTarget(self, action: #selector(didChangeCurrency(textField:)), for: .editingChanged)
        
        
        let service = GetCoinListsService()
        service.fetchCoinLists { result in
            switch result {
            case let .success(model):
                model.bpi.forEach { (_,value) in
                    self.currencyLists.append(value)
                }
                guard let defaultValue = self.currencyLists.first else { return }
                self.fromCurrencyModel = defaultValue
            case let .failure(error):
                print("error is \(error.localizedDescription)")
            }
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        tapGesture.delegate = self
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
        
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardNotification(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardNotification(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
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


extension ExchangeViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return true
    }
}


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
        fromCurrencyView.currencyNameLabel.text = currencyLists[indexPath].code
        fromCurrencyView.currencyImageView.image = Utils.shared.getImage(for: Utils.shared.getCurrenyType(for: currencyLists[indexPath].code))
    }
}

extension ExchangeViewController {
    private func convertCurrency(value: Float) -> Float {
        let rate = fromCurrencyModel.rate_float ?? 0.0
        return value / rate
    }
}
