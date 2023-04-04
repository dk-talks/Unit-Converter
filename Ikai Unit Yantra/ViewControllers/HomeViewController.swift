//
//  HomeViewController.swift
//  Ikai Unit Yantra
//
//  Created by Dinesh Sharma on 04/04/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var imgLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgLogo.layer.cornerRadius = 100
    }
   
}
