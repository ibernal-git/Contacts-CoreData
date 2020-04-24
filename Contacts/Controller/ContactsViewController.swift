//
//  TableViewController.swift
//  Contacts
//
//  Created by Imanol Bernal on 24/04/2020.
//  Copyright © 2020 Imanol Bernal. All rights reserved.
//

import UIKit
import CoreData

class ContactsViewController: UITableViewController, DataManagerDelegate {

    let dataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataManager.delegate = self
        dataManager.loadContacts()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let contact = dataManager.contacts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Cells.contacts, for: indexPath)
        cell.textLabel?.text = contact.name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: K.Segue.contactDetails, sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! ContactDetailViewController
        // Me guardo la fila seleccionada en la tabla
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedContact = dataManager.contacts[indexPath.row]
        }

    }
    
    //MARK: - Add Button
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let alert = dataManager.addNewElement(for: K.addButton.contacts)
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
