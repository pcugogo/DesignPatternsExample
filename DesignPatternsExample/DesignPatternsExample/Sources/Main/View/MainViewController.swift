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
    let designPatterns = DesignPatternFactory()
    
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
        return designPatterns.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return designPatterns.make(typeIndex: section).patterns.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = designPatterns.make(typeIndex: indexPath.section).patterns[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return designPatterns
            .make(typeIndex: section)
            .typeName
    }
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = designPatterns
            .make(typeIndex: indexPath.section)
            .makeViewController(designPatternIndex: indexPath.row)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

