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
        

        
        // Start Animation of KTLoadingLabel
        label.animate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

