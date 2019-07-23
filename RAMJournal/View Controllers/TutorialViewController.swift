//
//  TutorialViewController.swift
//  RAMJournal
//
//  Created by Taylor Bills on 5/27/19.
//  Copyright © 2019 Taylor Bills. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {

    
    // MARK: -  Properties
    
    @IBOutlet weak var gotItButton: UIButton!
    
    
    // MARK: -  Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gotItButton.layer.cornerRadius = 5
    }
    
    
    // MARK: -  Actions
    
    @IBAction func gotItButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
