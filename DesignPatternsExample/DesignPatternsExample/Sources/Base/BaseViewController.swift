//
//  BaseViewController.swift
//  DesignPatternsExample
//
//  Created by ChanWook Park on 2020/12/09.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setAttributes()
        layoutViews()
    }
}

extension BaseViewController {
    
    @objc func setAttributes() { }
    @objc func layoutViews() { }
}
