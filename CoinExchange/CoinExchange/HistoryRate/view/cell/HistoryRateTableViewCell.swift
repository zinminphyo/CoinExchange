//
//  HistoryRateTableViewCell.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 04/09/2022.
//

import UIKit

class HistoryRateTableViewCell: UITableViewCell {
    @IBOutlet weak var USDRateLabel: UILabel!
    @IBOutlet weak var EURRateLabel: UILabel!
    @IBOutlet weak var GBPRateLabel: UILabel!
    @IBOutlet weak var dateAndTimeLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    var shapeLayer: CAShapeLayer! = nil
    
    var historyRate: HistoryRateObject! = nil {
        didSet {
            UIBinding()
        }
    }
    
    
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        shapeLayer = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowRadius = 1
        containerView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        containerView.layer.shadowOpacity = 0.3
    }
    
    private func UIBinding() {
        USDRateLabel.text = "$ \(historyRate.USD_PRICE)"
        EURRateLabel.text = "€ \(historyRate.EUR_PRICE)"
        GBPRateLabel.text = "£ \(historyRate.GBP_PRICE)"
        dateAndTimeLabel.text = historyRate.dateTime
    }
    
}
