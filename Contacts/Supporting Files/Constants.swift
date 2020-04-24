//
//  Constants.swift
//  Contacts
//
//  Created by Imanol Bernal on 24/04/2020.
//  Copyright © 2020 Imanol Bernal. All rights reserved.
//

import Foundation
import UIKit

struct K {
    
    static let appName = "Contacts"
    static let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    static let error = "Er"
    
    struct Segue {
        static let contactDetails = "goToContactDetails"
        static let phones = "goToPhones"
        static let emails = "goToEmails"
        static let notes = "goToNotes"
    }
    struct Cells {
        static let contacts = "ContactsCell"
        static let contactDetails = "ContactDetails"
        static let phones = "PhonesCell"
        static let emails = "EmailsCell"
        static let notes = "NotesCell"
    }
    struct addButton {
        static let contacts = "Contacts"
        static let phones = "Phones"
        static let emails = "Emails"
        static let notes = "Notes"
        static let error = "The Add Button switch doesn't match the case"
    }
}
