//
//  MainViewController.swift
//  DesignPatternsExample
//
//  Created by ChanWook Park on 2020/12/09.
//

import UIKit

enum DesignPattern: Int {
    case command = 0
}

final class MainViewController: BaseViewController {

    let designPatterns = ["Command"]
    
    let designPatternsTableView = UITableView()
    
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return designPatterns.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = designPatterns[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case DesignPattern.command.rawValue:
            let commandViewController = CommandViewController()
            self.navigationController?.pushViewController(commandViewController, animated: true)
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
