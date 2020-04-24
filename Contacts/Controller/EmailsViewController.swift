//
//  EmailsViewController.swift
//  Contacts
//
//  Created by Imanol Bernal on 24/04/2020.
//  Copyright © 2020 Imanol Bernal. All rights reserved.
//

import UIKit
import CoreData

class EmailsViewController: UITableViewController, DataManagerDelegate {
    
    var selectedContact : Contacts?
    let dataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataManager.selectedContact = selectedContact
        dataManager.delegate = self
        dataManager.loadEmails()
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.emails.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let email = dataManager.emails[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Cells.emails, for: indexPath)
        cell.textLabel?.text = email.email
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        let alert = dataManager.addNewElement(for: K.addButton.emails)
        present(alert, animated: true, completion: nil)
        
    }
    
    func didSavedElement(_ dataManager: DataManager) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didLoadedElement(_ dataManager: DataManager) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    

}
