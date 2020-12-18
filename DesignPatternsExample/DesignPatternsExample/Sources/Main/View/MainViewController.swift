//
//  MainViewController.swift
//  DesignPatternsExample
//
//  Created by ChanWook Park on 2020/12/09.
//

import UIKit

final class MainViewController: BaseViewController {
    
    // UI
    let designPatternsTableView = UITableView()
    
    // Property
    let model = DesignPatternModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MainViewController {
    
    override func setAttributes() {
        
        self.view.backgroundColor = .white
        
        self.navigationItem.title = "Design Patterns"
        
        designPatternsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        designPatternsTableView.delegate = self
        designPatternsTableView.dataSource = self
        designPatternsTableView.separatorStyle = .none
    }
    
    override func layoutViews() {
        self.view.addSubview(designPatternsTableView)
        
        designPatternsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                designPatternsTableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                designPatternsTableView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
                designPatternsTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                designPatternsTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
            ]
        )
    }
}

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.patternTypes.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.patternTypes[section].patterns.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = model
            .patternTypes[indexPath.section]
            .patterns[indexPath.row].title
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return model.patternTypes[section].title
    }
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = model
            .patternTypes[indexPath.section]
            .patterns[indexPath.row].viewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
