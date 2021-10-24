//
//  SecondViewController.swift
//  Delegates
//
//  Created by Serkan Mehmet Malagiç on 24.10.2021.
//

import UIKit

protocol SecondViewControllerDelegate {
    func getRequest()
}
class SecondViewController: UIViewController {
   
    var secondViewControllerDelegate : SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func updateBtnTapped(_ sender: Any) {
        secondViewControllerDelegate?.getRequest()
    }
    
    


}
