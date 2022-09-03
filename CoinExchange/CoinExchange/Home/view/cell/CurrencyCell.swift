//
//  CurrencyCell.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 3/9/2565 BE.
//

import UIKit
import Kingfisher

class CurrencyCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var currencyNameLabel: UILabel!
    @IBOutlet weak var currencyRateLabel: UILabel!
    @IBOutlet weak var currenyDescriptionLabel: UILabel!
    @IBOutlet weak var currencyImageView: UIImageView!
    
    var currencyModel: CurrencyModel? = nil {
        didSet {
            UIBinding()
        }
    }
    
    static var identifier: String {
        String(describing: Self.self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func UIBinding() {
        guard let model = currencyModel else { return }
        currencyNameLabel.text = model.code
        currenyDescriptionLabel.text = model.description
        let type = getCurrenyType(for: model.code)
        currencyRateLabel.text = getCurrencySign(for: type) + model.rate
        currencyImageView.image = getImage(for: type)
    }
    
    func getCurrenyType(for name: String) -> CurrencyType {
        switch name {
        case "USD":
            return .USD
        case "EUR":
            return .EUR
        case "GBP":
            return .GBP
        default:
            return .UNKNOWN
        }
    }
    
    func getImage(for type: CurrencyType) -> UIImage? {
        switch type {
        case .USD:
            return Images.USD_LOGO
        case .EUR:
            return Images.EUR_LOGO
        case .GBP:
            return Images.GBP_LOGO
        case .UNKNOWN:
            return nil
        }
    }
    
    func getCurrencySign(for type: CurrencyType) -> String {
        switch type {
        case .USD:
            return "$ "
        case .EUR:
            return "€ "
        case .GBP:
            return "£ "
        case .UNKNOWN:
            return ""
        }
    }
}
