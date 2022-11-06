//
//  SubscriptExample.swift
//  SeSAC2Week18
//
//  Created by J on 2022/11/03.
//

import Foundation

extension String {
    
    // JAE >>> [1] >>> A
    subscript(idx: Int) -> String? {
        guard (0..<count).contains(idx) else {
            return nil
        }
        
        let result = index(startIndex, offsetBy: idx)
        
        return String(self[result])
        
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

struct Phone {
    var numbers = ["1234", "5678", "3355", "2222"]
    
    subscript(idx: Int) -> String {
        get {
            return self.numbers[idx]
        }
        set {
            self.numbers[idx] = newValue
        }
    }
}
