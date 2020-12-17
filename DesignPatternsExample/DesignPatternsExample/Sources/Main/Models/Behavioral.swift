//
//  Behavioral.swift
//  DesignPatternsExample
//
//  Created by ChanWook Park on 2020/12/18.
//

import UIKit

enum BehavioralDesignPattern: Int, DesignPatternViewControllerInitalizable {
    case command = 0
    
    var viewController: UIViewController {
        switch self {
        case .command:
            return CommandViewController()
        }
    }
}

struct Behavioral: DesignPattern {
    
    let typeName = "Behavioral"
    let patterns = ["Command"]
    
    func makeViewController(designPatternIndex: Int) -> UIViewController {
        let pattern = BehavioralDesignPattern(rawValue: designPatternIndex)!
        return pattern.viewController
    }
}
