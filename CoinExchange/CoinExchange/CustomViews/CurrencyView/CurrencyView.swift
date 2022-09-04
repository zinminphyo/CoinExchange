//
//  CurrencyView.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 04/09/2022.
//

import UIKit

class CurrencyView: ZMPDropDownView, NibLoadable {
    
    @IBOutlet weak var currencyImageView: UIImageView!
    @IBOutlet weak var currencyNameLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadedByNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadedByNib()
    }
    
    @IBAction func didTapDropDownBtn(_ sender: UIButton) {
        showDropDown()
    }
    
}
