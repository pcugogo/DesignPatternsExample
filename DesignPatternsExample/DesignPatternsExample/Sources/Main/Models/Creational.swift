//
//  Creational.swift
//  DesignPatternsExample
//
//  Created by ChanWook Park on 2020/12/18.
//

import UIKit

enum CreationalDesignPattern: Int, DesignPatternViewControllerInitalizable {
    case abstractFactory = 0
    
    var viewController: UIViewController {
        switch self {
        case .abstractFactory:
            return AbstractFactoryViewController()
        }
    }
}

struct Creational: DesignPattern {
    let typeName = "Creational"
    let patterns = ["AbstractFactory"]
    
    func makeViewController(designPatternIndex: Int) -> UIViewController {
        let pattern = CreationalDesignPattern(rawValue: designPatternIndex)!
        return pattern.viewController
    }
}
