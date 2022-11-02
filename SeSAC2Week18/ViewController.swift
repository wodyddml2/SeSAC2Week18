//
//  ViewController.swift
//  SeSAC2Week18
//
//  Created by J on 2022/11/02.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIService().login()
        APIService().profile()
    }


}

