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
    func execute() -> String
}
final class FillCommand: MilkCommand {
    let flavor: MilkFlavored
    
    init(flavor: MilkFlavored) {
        self.flavor = flavor
    }
    
    func execute() -> String {
        return "fill \(flavor.rawValue) milk."
    }
}

final class DrinkCommand: MilkCommand {
    let flavor: MilkFlavored
    
    init(flavor: MilkFlavored) {
        self.flavor = flavor
    }
    
    func execute() -> String {
        return "drank \(flavor.rawValue) milk."
    }
}

final class Milk {
    
    var flavor: MilkFlavored
    private let fillCommand: FillCommand
    private let drinkCommand: DrinkCommand
    
    init(flavor: MilkFlavored) {
        self.flavor = flavor
        self.fillCommand = FillCommand(flavor: flavor)
        self.drinkCommand = DrinkCommand(flavor: flavor)
    }
    
    func fill() -> String {
        return fillCommand.execute()
    }
    
    func drink() -> String {
        return drinkCommand.execute()
    }
}
