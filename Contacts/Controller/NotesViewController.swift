//
//  NotesViewController.swift
//  Contacts
//
//  Created by Imanol Bernal on 24/04/2020.
//  Copyright © 2020 Imanol Bernal. All rights reserved.
//

import UIKit
import CoreData

class NotesViewController: UITableViewController, DataManagerDelegate {

    var selectedContact : Contacts?
    let dataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataManager.selectedContact = selectedContact
        dataManager.delegate = self
        dataManager.loadNotes()
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.notes.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let note = dataManager.notes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Cells.notes, for: indexPath)
        cell.textLabel?.text = note.newNote
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        let alert = dataManager.addNewElement(for: K.addButton.notes)
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
