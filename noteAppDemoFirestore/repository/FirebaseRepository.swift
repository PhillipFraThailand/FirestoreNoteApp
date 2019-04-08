//
//  FirebaseRepository.swift
//  noteAppDemoFirestore
//
//  Created by Phillip Eismark on 12/03/2019.
//  Copyright © 2019 Phillip Eismark. All rights reserved.
//

import Foundation
import Firebase

let fR = FirebaseRepository() // <- initialiseret i global space. (kinda semi singleton)

class FirebaseRepository {
    
    var notes = [Note]()
    let notesCollection = Firestore.firestore().collection("notes")
    public var viewController:NoteViewController?
    
    //init er en constructor. når vi laver et objekt af denne klasse skal den starte notelistener
    init() {
        startNoteListener()
    }
    
    func startNoteListener(){
        notesCollection.addSnapshotListener { (snapshot, error) in
            print("Getting firestore data")
            self.notes.removeAll()
            print("Cleared notes list")
            for document in snapshot!.documents {
                if let text = document.data()["text"] as? String {
                    print("Recieved new snapshot from Firestore")
                    let id = document.documentID
                    let note = Note(t:text, nID:id)
                    self.notes.append(note)
                    print("Recieved \(text)")
                }
            }
            self.viewController?.reloadTableSomething()
        }
    }

    func getStatus() -> String {
        return notesCollection.collectionID
    }
}
