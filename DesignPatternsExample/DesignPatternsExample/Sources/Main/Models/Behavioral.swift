//
//  Behavioral.swift
//  DesignPatternsExample
//
//  Created by ChanWook Park on 2020/12/18.
//

import UIKit

enum BehavioralDesignPattern: String, DesignPattern {
    case command = "Command"
    
    var title: String {
        self.rawValue
    }
    var viewController: UIViewController {
        switch self {
        case .command:
            return CommandViewController()
        }
    }
}

struct Behavioral: DesignPatternType {
    
    let title: String = "Behavioral"
    let patterns: [DesignPattern] = [BehavioralDesignPattern.command]
}
