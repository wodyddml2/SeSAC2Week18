//
//  ViewController.swift
//  SeSAC2Week18
//
//  Created by J on 2022/11/02.
//

import UIKit

import RxSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    let viewModel = ProfileViewModel()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let phone = Phone()
        print(phone[2]) 
        
        viewModel.profile // <single>, syntax sugar
            .withUnretained(self)
            .subscribe { vc, value in
                vc.label.text = value.user.email
            } onError: { error in
                print(error.localizedDescription)
            }
            .disposed(by: disposeBag)

        viewModel.getProfile()
        // subscribe, bind, drive
        // driver vc signal
        
        checkCOW()
    }
    
    func checkCOW() {
        var test = "Jaaw"
        address(&test)
        print(test[2])
        print(test[200])
        var test2 = test
        address(&test2)
        
        test2 = "Y"
        address(&test)
        address(&test2)
        
        var array = Array(repeating: "A", count: 100)
        address(&array)
        print(array[safe: 99])
        print(array[safe: 199])
        var array2 = array
        address(&array2)
        
        array2[0] = "B"
        
        address(&array)
        address(&array2)
        

    }

    func address(_ value: UnsafeRawPointer) {
        let address = String(format: "%p", Int(bitPattern: value))
        print(address)
    }
}

