//
//  WelcomePresenter.swift
//  CoinExchange
//
//  Created by admin on 3/9/2565 BE.
//

import Foundation


class WelcomePresenter: WelcomePresenting {
    
    var view: WelcomeViewControlling?
    
    var router: WelcomeRouting?
    
    func viewDidLoad() {
        
    }
    
    func viewDidAppear() {
        view?.renderWelcomeImageAnimation()
        view?.renderWelcomeGreetingLabelAnimation()
    }
    
    func didFinishedWelcomeAnimation() {
        router?.routeToInAppVC()
    }
    
    
}
