//
//  Entry.swift
//  RAMJournal
//
//  Created by Taylor Bills on 5/7/19.
//  Copyright © 2019 Taylor Bills. All rights reserved.
//

import Foundation

class Entry: Equatable, Codable {
    
    
    // MARK: -  Properties
    
    var title: String
    var body: String
    var dateSaved: String
    
    init(title: String, body: String, dateSaved: String) {
        self.title = title
        self.body = body
        self.dateSaved = dateSaved
    }
    
    
    // MARK: -  Equatable Protocol
    
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.title == rhs.title &&
        lhs.body == rhs.body &&
        lhs.dateSaved == rhs.dateSaved
    }
}
