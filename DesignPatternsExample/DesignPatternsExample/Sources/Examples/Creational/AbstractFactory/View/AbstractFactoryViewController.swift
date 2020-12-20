//
//  AbstractFactoryViewController.swift
//  DesignPatternsExample
//
//  Created by ChanWook Park on 2020/12/18.
//

import UIKit

final class AbstractFactoryViewController: BaseViewController {
    
    let messageLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Client
        let americano = CoffeeFactory.americano.make()
        let latte = CoffeeFactory.latte.make()
        let americanoDescription = "\(americano.name) contains \(americano.ingredient)."
        let latteDescription = "\(latte.name) contains \(latte.ingredient)."
        
        messageLabel.text = "\(americanoDescription)\n\(latteDescription)"
    }
}

extension AbstractFactoryViewController {
    override func setAttributes() {
        self.view.backgroundColor = .white
        
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
    }
}

extension AbstractFactoryViewController {
    override func layoutViews() {
        self.view.addSubview(messageLabel)
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
         [
            messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            messageLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            messageLabel.heightAnchor.constraint(equalToConstant: 250)
         ]
        )
    }
}
