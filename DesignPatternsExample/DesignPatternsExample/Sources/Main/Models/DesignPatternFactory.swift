//
//  DesignPatternFactory.swift
//  DesignPatternsExample
//
//  Created by ChanWook Park on 2020/12/18.
//

import Foundation

enum DesignPatternType: Int {
    case behavioral = 0
    case creational
}

struct DesignPatternFactory: DesignPatternMakable {
    
    var count = 2
    
    func make(typeIndex: Int) -> DesignPattern {
        switch DesignPatternType(rawValue: typeIndex)! {
        case .behavioral:
            return Creational()
        case .creational:
            return Behavioral()
        }
    }
}
