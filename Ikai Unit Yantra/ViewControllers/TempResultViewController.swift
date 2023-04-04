//
//  TempResultViewController.swift
//  Ikai Unit Yantra
//
//  Created by Dinesh Sharma on 04/04/23.
//

import UIKit

class TempResultViewController: UIViewController {
    
    var fromUnit: String?
    var toUnit: String?
    var fromValue: Double?
    var toValue: Double?
    
    
    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let fromUnit = fromUnit,
           let toUnit = toUnit,
           let fromValue = fromValue,
           let toValue = toValue {
        
            lblResult.text = "\(fromValue) \(fromUnit) equals \(toValue) \(toUnit)"
        }
        

    }
    

   
}
