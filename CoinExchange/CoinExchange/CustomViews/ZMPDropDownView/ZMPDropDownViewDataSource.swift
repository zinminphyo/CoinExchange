//
//  ZMPDropDownViewDataSource.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 04/09/2022.
//

import Foundation


protocol ZMPDropDownViewDataSource {
    func numberOfItem(in view: ZMPDropDownView) -> Int
    func dataForItem(at index: Int) -> ZMPItem
}

protocol ZMPDropDownViewDelegate {
    func didSelectItem(at indexPath: Int, in view: ZMPDropDownView)
}


protocol ZMPItem {
    func getTitle() -> String
}
