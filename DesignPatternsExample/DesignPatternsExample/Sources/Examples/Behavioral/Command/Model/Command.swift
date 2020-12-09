//
//  Command.swift
//  DesignPatternsExample
//
//  Created by ChanWook Park on 2020/12/09.
//

import UIKit

enum MilkFlavored: String {
    case chocolate
    case banana
    case strawberry
    
    var color: UIColor {
        switch self {
        case .chocolate:
            return .brown
        case .banana:
            return .systemYellow
        case .strawberry:
            return .systemPink
        }
    }
}

protocol MilkCommand {
    func fill() -> String
    func drinking() -> String
}

final class Milk: MilkCommand {
    
    let flavor: MilkFlavored
    
    init(flavor: MilkFlavored) {
        self.flavor = flavor
    }
    
    func fill() -> String {
        return "fill \(flavor.rawValue) milk."
    }
    
    func drinking() -> String {
        return "drank \(flavor.rawValue) milk."
    }
}
