//
//  AbstractFactoryViewController.swift
//  DesignPatternsExample
//
//  Created by ChanWook Park on 2020/12/18.
//

import UIKit

final class AbstractFactoryViewController: UIViewController {

    // Client
    let americano = CoffeeFactory.americano.make()
    let latte = CoffeeFactory.americano.make()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("This coffee contains \(americano.ingredient).")
        print("This coffee contains \(latte.ingredient).")
    }
}
