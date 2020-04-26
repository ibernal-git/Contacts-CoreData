//
//  PhonesViewController.swift
//  Contacts
//
//  Created by Imanol Bernal on 24/04/2020.
//  Copyright © 2020 Imanol Bernal. All rights reserved.
//

import UIKit
import CoreData

class PhonesViewController: ContactsSuperClass, DataManagerDelegate {

    var selectedContact : Contacts?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataManager.selectedContact = selectedContact
        dataManager.delegate = self
        dataManager.loadPhones()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.phones.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let phone = dataManager.phones[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Cells.phones, for: indexPath)
        cell.textLabel?.text = phone.phoneNumber

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let alert = super.addNewElement(for: K.addButton.phones)
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
