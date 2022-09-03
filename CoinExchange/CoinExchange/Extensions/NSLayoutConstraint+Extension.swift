//
//  NSLayoutConstraint+Extension.swift
//  CoinExchange
//
//  Created by admin on 2/9/2565 BE.
//

import Foundation
import UIKit



extension NSLayoutConstraint {
    func multiplier(_ multiplier: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self.firstItem!, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: multiplier, constant: 0)
    }
}
