//
//  AbstractFactory.swift
//  DesignPatternsExample
//
//  Created by ChanWook Park on 2020/12/18.
//

import Foundation

// Abstact Product
protocol Coffee {
    var ingredient: String { get }
}

// Abstact Factory
protocol CoffeeMakable {
    func make() -> Coffee
}

// Abstact Product
struct Americano: Coffee {
    var ingredient = "Water"
}
// Abstact Product
struct Latte: Coffee {
    var ingredient = "Milk"
}

// Concrete Factory
enum CoffeeFactory: CoffeeMakable {
    case americano
    case latte
    
    func make() -> Coffee {
        switch self {
        case .americano:
            return Americano()
        case .latte:
            return Latte()
        }
    }
}
