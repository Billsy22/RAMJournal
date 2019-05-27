//
//  EntryListTableViewController.swift
//  RAMJournal
//
//  Created by Taylor Bills on 5/7/19.
//  Copyright © 2019 Taylor Bills. All rights reserved.
//

import UIKit

class EntryListTableViewController: UITableViewController {

    
    // MARK: -  Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomButtonActivation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        randomButtonActivation()
        tableView.reloadData()
    }

    
    // MARK: -  Properties
    
    @IBOutlet weak var randomEntryButton: UIBarButtonItem!
    
    
    // MARK: - Table View Data Source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.shared.entries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.shared.entryTableViewCellIdentifier, for: indexPath)
        guard let entry = EntryController.shared.entries[indexPath.row] else { return UITableViewCell() }
        cell.textLabel?.text = entry.title
        cell.detailTextLabel?.text = entry.dateSaved
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let entry = EntryController.shared.entries[indexPath.row] else { return }
            EntryController.shared.deleteSelected(entry: entry)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
            randomButtonActivation()
        }
    }
    

    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.shared.editEntrySegueIdentifier {
            guard let indexPath = self.tableView.indexPathForSelectedRow else { return }
            let entry = EntryController.shared.entries[indexPath.row]
            guard let editEntryViewController = segue.destination as? EntryDetailViewController else { return }
            editEntryViewController.entry = entry
        }
    }
    
    
    // MARK: -  DRY Methods
    
    func randomButtonActivation() {
        if EntryController.shared.entries.count == 0 {
            self.randomEntryButton.isEnabled = false
        } else {
            self.randomEntryButton.isEnabled = true
        }
    }
}
