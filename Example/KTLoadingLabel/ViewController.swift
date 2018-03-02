//
//  ViewController.swift
//  KTLoadingLabel
//
//  Created by Koki Tang on 03/02/2018.
//  Copyright (c) 2018 Koki Tang. All rights reserved.
//

import UIKit
import KTLoadingLabel

class ViewController: UIViewController {
    let label = KTLoadingLabel.init(staticString: "Loading", animateString: "...")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup KTLoadingLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        // Layout by setting constraints to view
        /* Can also use frame/storyboard/xib to config */
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 16).isActive = true
        label.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: 8).isActive = true
        
        // Start Animation of KTLoadingLabel
        label.animate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

