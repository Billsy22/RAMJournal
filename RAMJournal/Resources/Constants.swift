//
//  Constants.swift
//  RAMJournal
//
//  Created by Taylor Bills on 5/7/19.
//  Copyright © 2019 Taylor Bills. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    
    // MARK: -  Singleton
    
    static let shared = Constants()
    
    
    // MARK: -  String Literals
    
    let editEntrySegueIdentifier = "editEntrySegue"
    let entryTableViewCellIdentifier = "entryTableViewCell"
    let entryDetailViewControllerIdentifier = "EntryDetailViewController"
    
    
    // MARK: -  Colors
    
    let textViewBorderColor = UIColor(red: 215.0/255.0, green: 215.0/255.0, blue: 215.0/255.0, alpha: 1).cgColor
    let mainYellowColor = UIColor(red: 255.0/255.0, green: 232.0/255.0, blue: 16.0/255.0, alpha: 1.0)
    let mainGreenColor = UIColor(red: 54.0/255.0, green: 93.0/255.0, blue: 20.0/255.0, alpha: 1.0)
    let mainPurpleColor = UIColor(red: 201.0/255.0, green: 186.0/255.0, blue: 221.0/255.0, alpha: 1.0)
    let mainLightGrayColor = UIColor(red: 189.0/255.0, green: 193.0/255.0, blue: 199.0/255.0, alpha: 1.0)
    
    // MARK: -  DateFormatter
    
    func formatDate() -> String {
        let dateFormatterSet = DateFormatter()
        dateFormatterSet.dateFormat = "MM/dd/yyyy"
        let dateString = dateFormatterSet.string(from: Date())
        return dateString
    }
    
    
    // MARK: -  DRY Methods
    
    func textViewFormatChange(textView: UITextView) {
        textView.layer.borderColor = Constants.shared.textViewBorderColor
        textView.layer.borderWidth = 0.6
        textView.layer.cornerRadius = 6.0
    }
}
