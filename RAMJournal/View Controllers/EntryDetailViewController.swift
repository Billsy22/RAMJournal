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
        Constants.shared.textViewFormatChange(textView: entryBodyTextView)
        updateViews()
    }
    
    
    // MARK: -  Properties and Outlets
    
    @IBOutlet weak var entryTitleTextField: UITextField!
    @IBOutlet weak var entryBodyTextView: UITextView!
    var entry: Entry?
    
    
    // MARK: -  Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let entryTitle = entryTitleTextField.text, let entryBody = entryBodyTextView.text else { return }
        
        if let entry = entry {
            EntryController.shared.update(entry: entry, withTitle: entryTitle, andBody: entryBody)
        } else {
            let date = Constants.shared.formatDate()
            EntryController.shared.createNewEntry(title: entryTitle, body: entryBody, dateSaved: date)
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: -  View Methods
    
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
