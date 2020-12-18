//
//  CommandViewController.swift
//  DesignPatternsExample
//
//  Created by ChanWook Park on 2020/12/09.
//

import UIKit

final class CommandViewController: BaseViewController {
    
    // Model
    var milk: Milk?
    
    // UI
    let statusTextLabel = UILabel()
    let milkPackLabel = UILabel()
    let tasteChoiceStackView = UIStackView()
    let tasteChoiceTextLabel = UILabel()
    let chocolateButton = UIButton()
    let bananaButton = UIButton()
    let strawberryButton = UIButton()
    let drinkButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CommandViewController {
    
    override func setAttributes() {
        
        self.view.backgroundColor = .white
        self.navigationItem.title = "Command Pattern"
        
        statusTextLabel.backgroundColor = .lightGray
        statusTextLabel.textAlignment = .center
        
        milkPackLabel.text = "Milk Pack"
        milkPackLabel.layer.borderWidth = 1.0
        milkPackLabel.layer.borderColor = UIColor.black.cgColor
        milkPackLabel.textAlignment = .center
        
        tasteChoiceStackView.axis = .vertical
        
        tasteChoiceTextLabel.text = "Milk flavors"
        tasteChoiceTextLabel.textAlignment = .center
        
        chocolateButton.setTitle("chocolate", for: .normal)
        chocolateButton.backgroundColor = MilkFlavored.chocolate.color
        chocolateButton.addTarget(self, action: #selector(chocolateButtonAction), for: .touchUpInside)
        
        bananaButton.setTitle("banana", for: .normal)
        bananaButton.backgroundColor = MilkFlavored.banana.color
        bananaButton.addTarget(self, action: #selector(bananaButtonAction), for: .touchUpInside)
        
        strawberryButton.setTitle("strawberry", for: .normal)
        strawberryButton.backgroundColor = MilkFlavored.strawberry.color
        strawberryButton.addTarget(self, action: #selector(strawberryButtonAction), for: .touchUpInside)
        
        drinkButton.setTitle("Drink !!", for: .normal)
        drinkButton.backgroundColor = .lightGray
        drinkButton.isEnabled = false
        drinkButton.addTarget(self, action: #selector(drinkButtonAction), for: .touchUpInside)
    }
    
    override func layoutViews() {
        self.view.addSubviews(
            [
                statusTextLabel,
                milkPackLabel,
                tasteChoiceStackView,
                drinkButton
            ]
        )
        
        statusTextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                statusTextLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                statusTextLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
                statusTextLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
                statusTextLabel.heightAnchor.constraint(equalToConstant: 30)
            ]
        )
        
        milkPackLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                milkPackLabel.topAnchor.constraint(equalTo: statusTextLabel.bottomAnchor, constant: 30),
                milkPackLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                milkPackLabel.widthAnchor.constraint(equalToConstant: 100),
                milkPackLabel.heightAnchor.constraint(equalToConstant: 150)
            ]
        )
        
        tasteChoiceStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                tasteChoiceStackView.topAnchor.constraint(equalTo: milkPackLabel.bottomAnchor, constant: 30),
                tasteChoiceStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                tasteChoiceStackView.widthAnchor.constraint(equalToConstant: 200)
            ]
        )
        
        tasteChoiceStackView.addArrangedSubviews(
            [
                tasteChoiceTextLabel,
                chocolateButton,
                bananaButton,
                strawberryButton
            ]
        )
        
        drinkButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                drinkButton.topAnchor.constraint(equalTo: tasteChoiceStackView.bottomAnchor, constant: 15),
                drinkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                drinkButton.widthAnchor.constraint(equalToConstant: 100),
                drinkButton.heightAnchor.constraint(equalToConstant: 50)
            ]
        )
    }
}

extension CommandViewController {
    
    @objc func chocolateButtonAction() {
        fillMilkPack(flavor: .chocolate)
    }
    
    @objc func bananaButtonAction() {
        fillMilkPack(flavor: .banana)
    }
    
    @objc func strawberryButtonAction() {
        fillMilkPack(flavor: .strawberry)
    }
    
    @objc func drinkButtonAction() {
        statusTextLabel.text = milk?.drink()
    }
}

extension CommandViewController {
    
    private func fillMilkPack(flavor: MilkFlavored) {
        milk = Milk(flavor: flavor)
        statusTextLabel.text = milk?.fill()
        milkPackLabel.backgroundColor = milk?.flavor.color
        milkPackLabel.text = milk?.flavor.rawValue
        drinkButton.isEnabled = true
        drinkButton.backgroundColor = .systemBlue
    }
}
