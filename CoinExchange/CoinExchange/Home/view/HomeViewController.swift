//
//  HomeViewController.swift
//  CoinExchange
//
//  Created by admin on 2/9/2565 BE.
//

import UIKit

class HomeViewController: UIViewController {

    static var identifier: String {
        String(describing: Self.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func didTapClickMeBtn(_ sender: UIButton) {
        
        let vc = ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
