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
        textViewFormatChange()
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
            EntryController.shared.createNewEntry(title: entryTitle, body: entryBody, dateSaved: "date")
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: -  DRY Methods
    
    func textViewFormatChange() {
        entryBodyTextView.layer.borderColor = Constants.shared.textViewBorderColor
        entryBodyTextView.layer.borderWidth = 0.6
        entryBodyTextView.layer.cornerRadius = 6.0
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
