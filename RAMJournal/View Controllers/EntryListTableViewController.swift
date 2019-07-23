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
        navigationBarSetup()
        setUpTableView()
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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.shared.entries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.shared.entryTableViewCellIdentifier, for: indexPath)
        guard let entry = EntryController.shared.entries[indexPath.section] else { return UITableViewCell() }
        cell.widthAnchor.constraint(equalToConstant: self.tableView.frame.width / 2)
        cell.textLabel?.text = entry.title
        cell.detailTextLabel?.text = entry.dateSaved
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let entry = EntryController.shared.entries[indexPath.section] else { return }
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
            let entry = EntryController.shared.entries[indexPath.section]
            guard let editEntryViewController = segue.destination as? EntryDetailViewController else { return }
            editEntryViewController.entry = entry
        }
    }
    
    
    // MARK: -  UI Methods
    
    func randomButtonActivation() {
        if EntryController.shared.entries.count == 0 {
            self.randomEntryButton.isEnabled = false
        } else {
            self.randomEntryButton.isEnabled = true
        }
    }
    
    func navigationBarSetup() {
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.backgroundColor = .clear
    }
    
    func setUpTableView() {
        self.tableView.tableFooterView = UIView.init(frame: .zero)
        self.tableView.tableFooterView?.backgroundColor = .clear
    }
}
