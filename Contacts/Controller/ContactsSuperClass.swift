//
//  ViewController.swift
//  Contacts
//
//  Created by Imanol Bernal on 26/04/2020.
//  Copyright © 2020 Imanol Bernal. All rights reserved.
//

import UIKit

class ContactsSuperClass: UITableViewController {
    
    let dataManager = DataManager()
    let context = K.context

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func addNewElement(for element: String) -> UIAlertController {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New \(element)", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add \(element)", style: .default) { (action) in
            
            switch element {
            case K.addButton.contacts:
                let newContact = Contacts(context: self.context)
                newContact.name = textField.text!
                self.dataManager.contacts.append(newContact)
                self.dataManager.saveData()
            case K.addButton.phones:
                let newPhone = Phones(context: self.context)
                newPhone.phoneNumber = textField.text!
                newPhone.parentContact = self.dataManager.selectedContact
                self.dataManager.phones.append(newPhone)
                self.dataManager.saveData()
            case K.addButton.emails:
                let newEmail = Emails(context: self.context)
                newEmail.email = textField.text!
                newEmail.parentContact = self.dataManager.selectedContact
                self.dataManager.emails.append(newEmail)
                self.dataManager.saveData()
            case K.addButton.notes:
                let newNote = Notes(context: self.context)
                newNote.newNote = textField.text!
                newNote.parentContact = self.dataManager.selectedContact
                self.dataManager.notes.append(newNote)
                self.dataManager.saveData()
            default:
                print(K.addButton.error)
            }
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New \(element)"
            textField = alertTextField
            
        }
        
        alert.addAction(action)
        return alert
    }

}
