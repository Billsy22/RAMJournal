//
//  TutorialViewController.swift
//  RAMJournal
//
//  Created by Taylor Bills on 5/27/19.
//  Copyright © 2019 Taylor Bills. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {

    
    // MARK: -  Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: -  Actions
    
    @IBAction func gotItButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
