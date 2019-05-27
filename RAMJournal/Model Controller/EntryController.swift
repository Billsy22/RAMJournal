//
//  EntryController.swift
//  RAMJournal
//
//  Created by Taylor Bills on 5/7/19.
//  Copyright © 2019 Taylor Bills. All rights reserved.
//

import Foundation

class EntryController {
    
    // MARK: -  Properties
    
    static let shared = EntryController()
    var entries : [Entry?] = []
    
    
    // MARK: -  Initializer
    
    init() {
        loadFromStorage()
    }
    // MARK: -  Entry management functions
    
    func createNewEntry(title: String, body: String, dateSaved: String) {
        let newEntry = Entry(title: title, body: body, dateSaved: dateSaved)
        self.entries.append(newEntry)
        saveToStorage()
    }
    
    func deleteSelected(entry: Entry) {
        guard let index = entries.firstIndex(of: entry) else {
            print("Entry you are trying to delete does not exist")
            return
        }
        entries.remove(at: index)
        saveToStorage()
    }
    
    func update(entry: Entry, withTitle title: String, andBody body: String) {
        entry.title = title
        entry.body = body
        saveToStorage()
    }
    
    /// "Random Access Memory" this function is used to randomly select an index in a range from 0 to the number of items in our "entries" source, pull that specific entry from the list, and return that entry.
    func ram() -> Entry? {
        let randomIndex = Int.random(in: 0..<self.entries.count)
        guard let randomEntry = entries[randomIndex] else { return nil }
        return randomEntry
    }
    
    
    // MARK: -  Persistence
    
    // File Save Location
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        let fileName = "RAMJournal.json"
        let url = documentDirectory.appendingPathComponent(fileName)
        return url
    }
    
    // Save Files
    func saveToStorage() {
        let jsonEncoder = JSONEncoder()
        do {
            let data = try jsonEncoder.encode(entries)
            try data.write(to: fileURL())
        } catch let error {
            print("Error saving to disk: \(error.localizedDescription)")
        }
    }
    
    // Load Files
    func loadFromStorage() {
        let jsonDecoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let loadedEntries = try jsonDecoder.decode([Entry].self, from: data)
            self.entries = loadedEntries
        } catch let error {
            print("Error loading from disk \(error.localizedDescription)")
        }
    }
}
