//
//  DesignPattern.swift
//  DesignPatternsExample
//
//  Created by ChanWook Park on 2020/12/18.
//

import UIKit

protocol DesignPattern {
    var typeName: String { get }
    var patterns: [String] { get }
    
    func makeViewController(designPatternIndex: Int) -> UIViewController
}

protocol DesignPatternViewControllerInitalizable {
    var viewController: UIViewController { get }
}

protocol DesignPatternMakable {
    func make(typeIndex: Int) -> DesignPattern
}
