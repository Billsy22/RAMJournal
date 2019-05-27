//
//  RandomEntryViewController.swift
//  RAMJournal
//
//  Created by Taylor Bills on 5/27/19.
//  Copyright © 2019 Taylor Bills. All rights reserved.
//

import UIKit

class RandomEntryViewController: UIViewController {

    
    // MARK: -  Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Constants.shared.textViewFormatChange(textView: entryBodyTextView)
        updateViews()
    }
    
    
    // MARK: -  Properties
    
    @IBOutlet weak var entryTitleTextField: UITextField!
    @IBOutlet weak var entryBodyTextView: UITextView!
    
    
    // MARK: -  DRY Methods
    
    func updateViews() {
        guard let randomEntry = EntryController.shared.ram() else { return }
        entryTitleTextField.text = randomEntry.title
        entryBodyTextView.text = randomEntry.body
    }
}
