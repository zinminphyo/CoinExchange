//
//  WelcomeViewController.swift
//  CoinExchange
//
//  Created by admin on 2/9/2565 BE.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    static var identifier: String {
        String(describing: Self.self)
    }
    
    
    @IBOutlet weak var welcomeImageView: UIImageView!
    @IBOutlet weak var welcomeGreetingLabel: UILabel!
    @IBOutlet weak var welcomeImageViewCenterYConstraint: NSLayoutConstraint!
    @IBOutlet weak var welcomeGreetingLabelCenterYConstraint: NSLayoutConstraint!
    
    var presenter: WelcomePresenting?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /// Start Animation after 1 second delay of view did load.
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.presenter?.viewDidAppear()
        }
        
    }
    
   

}

// MARK: - Welcome View Controlling Conformance.
extension WelcomeViewController: WelcomeViewControlling {
    
    func renderWelcomeImageAnimation() {
        welcomeImageViewAnimation()
    }
    
    func renderWelcomeGreetingLabelAnimation() {
        welcomeGreetingLabelAnimation()
    }
}


// MARK: - Welcome View Animating.
extension WelcomeViewController {
    /// Welcome Image View Animation with AutoLayout Constraint.
    private func welcomeImageViewAnimation() {
        
        let newWelcomeImageViewConstraint = welcomeImageViewCenterYConstraint.multiplier(0.7)
        view.removeConstraint(welcomeImageViewCenterYConstraint)
        view.addConstraint(newWelcomeImageViewConstraint)
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: { [weak self] in
            self?.view.layoutIfNeeded()
            self?.welcomeGreetingLabel.isHidden = false
        }, completion: nil)
        
    }
    
    /// Welcome Greeting Label Animation with AutoLayout Constraint.
    private func welcomeGreetingLabelAnimation() {
        let newGreetingLabelConstraint = welcomeGreetingLabelCenterYConstraint.multiplier(1.0)
        view.removeConstraint(welcomeGreetingLabelCenterYConstraint)
        view.addConstraint(newGreetingLabelConstraint)
        
        UIView.animate(withDuration: 1.0, delay: 0.2, options: .curveEaseInOut, animations: { [weak self] in
            self?.view.layoutIfNeeded()
        }, completion: { [weak self] _ in
            self?.presenter?.didFinishedWelcomeAnimation()
        })
    }
}
