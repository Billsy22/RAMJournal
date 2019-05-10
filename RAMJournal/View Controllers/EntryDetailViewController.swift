//
//  EntryDetailViewController.swift
//  RAMJournal
//
//  Created by Taylor Bills on 5/9/19.
//  Copyright © 2019 Taylor Bills. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextViewDelegate {

    
    // MARK: -  Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        entryBodyTextView.delegate = self
    }
    
    
    // MARK: -  Properties and Outlets
    
    @IBOutlet weak var entryTitleTextField: UITextField!
    @IBOutlet weak var entryBodyTextView: UITextView!
    var entry: Entry?
    
    
    // MARK: -  DRY Methods
    
    func textViewFormatChange() {
        
    }
    
    func updateViews() {
        if entry == nil {
            entryBodyTextView.text = "Dear diary..."
            entryBodyTextView.textColor = UIColor.lightGray
        } else {
            guard let entry = entry else { return }
            entryTitleTextField.text = entry.title
            entryBodyTextView.text = entry.body
        }
    }
    
    
    // MARK: -  UITextViewDelegateMethods
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if entryBodyTextView.textColor == UIColor.lightGray {
            entryBodyTextView.text = nil
            entryBodyTextView.textColor = UIColor.black
        }
    }
}
