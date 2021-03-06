//
//  DataManager.swift
//  Contacts
//
//  Created by Imanol Bernal on 24/04/2020.
//  Copyright © 2020 Imanol Bernal. All rights reserved.
//

import UIKit
import CoreData

protocol DataManagerDelegate {
    func didSavedElement(_ dataManager: DataManager)
    func didLoadedElement(_ dataManager: DataManager)
    func didFailWithError(error: Error)
}

class DataManager {
    
    let context = K.context
    var selectedContact: Contacts?
    var contacts = [Contacts]()
    var phones = [Phones]()
    var emails = [Emails]()
    var notes = [Notes]()
    
    var delegate : DataManagerDelegate?
    
    func loadContacts (with request: NSFetchRequest<Contacts> = Contacts.fetchRequest(), predicate: NSPredicate? = nil) {
        
        do {
            contacts = try context.fetch(request)
            delegate?.didLoadedElement(self)
        } catch {
            print("Error loading contacts. \(error)")
        }
        
    }
    
    func preparePredicate (selectedContact: Contacts, predicate: NSPredicate? = nil) -> NSPredicate {
        
        let contactPredicate = NSPredicate(format: "parentContact.name MATCHES %@", selectedContact.name!)
        
        if let additionalPredicate = predicate {
            return NSCompoundPredicate(andPredicateWithSubpredicates: [contactPredicate, additionalPredicate])
        } else {
            return contactPredicate
        }
        
    }
    
    func loadPhones (with request: NSFetchRequest<Phones> = Phones.fetchRequest(), predicate: NSPredicate? = nil) {
        
        if let safeContact = selectedContact {
            request.predicate = preparePredicate(selectedContact: safeContact)
        }
        do {
            phones = try context.fetch(request)
            delegate?.didLoadedElement(self)
        } catch {
            print("Error loading phones. \(error)")
        }
        
    }
    
    func loadEmails (with request: NSFetchRequest<Emails> = Emails.fetchRequest(), predicate: NSPredicate? = nil) {
        
        if let safeContact = selectedContact {
            request.predicate = preparePredicate(selectedContact: safeContact)
        }
        do {
            emails = try context.fetch(request)
            delegate?.didLoadedElement(self)
        } catch {
            print("Error loading emails. \(error)")
        }
        
    }
    
    func loadNotes (with request: NSFetchRequest<Notes> = Notes.fetchRequest(), predicate: NSPredicate? = nil) {
        
        if let safeContact = selectedContact {
            request.predicate = preparePredicate(selectedContact: safeContact)
        }
        do {
            notes = try context.fetch(request)
            delegate?.didLoadedElement(self)
        } catch {
            print("Error loading notes. \(error)")
        }
        
    }
    
    func saveData() {
        
        do {
            try context.save()
            delegate?.didSavedElement(self)
        } catch {
            print("Error saving data. \(error)")
        }
        
    }
    
}
