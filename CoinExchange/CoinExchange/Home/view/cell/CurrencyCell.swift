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
        let type = Utils.shared.getCurrenyType(for: model.code)
        currencyRateLabel.text = Utils.shared.getCurrencySign(for: type) + model.rate
        currencyImageView.image = Utils.shared.getImage(for: type)
    }
    
}
