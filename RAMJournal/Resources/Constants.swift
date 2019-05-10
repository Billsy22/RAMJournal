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
    
    
    // MARK: -  Colors
    
    let textViewBorderColor = UIColor(red: 215.0/255.0, green: 215.0/255.0, blue: 215.0/255.0, alpha: 1).cgColor
}
