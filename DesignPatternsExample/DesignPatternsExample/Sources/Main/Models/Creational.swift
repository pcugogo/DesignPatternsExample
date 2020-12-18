//
//  Creational.swift
//  DesignPatternsExample
//
//  Created by ChanWook Park on 2020/12/18.
//

import UIKit

enum CreationalDesignPattern: String, DesignPattern {
    case abstractFactory = "AbstractFactory"
    
    var title: String {
        self.rawValue
    }
    var viewController: UIViewController {
        switch self {
        case .abstractFactory:
            return AbstractFactoryViewController()
        }
    }
}

struct Creational: DesignPatternType {
    
    let title: String = "Creational"
    let patterns: [DesignPattern] = [CreationalDesignPattern.abstractFactory]
}
