//
//  ContactDetailViewController.swift
//  Contacts
//
//  Created by Imanol Bernal on 24/04/2020.
//  Copyright © 2020 Imanol Bernal. All rights reserved.
//

import UIKit

class ContactDetailViewController: UITableViewController {
    
    @IBOutlet weak var contactNavBar: UINavigationItem!
    
    var selectedContact : Contacts?
    let details = ["Phones","Emails","Notes"]

    override func viewDidLoad() {
        super.viewDidLoad()
        contactNavBar.title = selectedContact?.name
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Cells.contactDetails, for: indexPath)
        cell.textLabel?.text = details[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: K.Segue.phones, sender: self)
        case 1:
            performSegue(withIdentifier: K.Segue.emails, sender: self)
        case 2:
            performSegue(withIdentifier: K.Segue.notes, sender: self)
        default:
            print("error")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == K.Segue.phones {
            
            let destinationVC = segue.destination as! PhonesViewController
            destinationVC.selectedContact = selectedContact
            
        }
        if segue.identifier == K.Segue.emails {
            
            let destinationVC = segue.destination as! EmailsViewController
            destinationVC.selectedContact = selectedContact
            
        }
        if segue.identifier == K.Segue.notes {
            
            let destinationVC = segue.destination as! NotesViewController
            destinationVC.selectedContact = selectedContact
            
        }
        
    }
}
