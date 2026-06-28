//
//  NoteStore.swift
//  NotesApp
//
//  Created by vinayagamoorthi on 07/06/26.
//

import Foundation

@Observable
class NoteStore {
   
    var notes: [Note] = []
    let storageKey = "saved_notes"
    
    init() {
        load()
    }

    func createNote(title: String, content: String) {
        let note = Note(title: title, content: content)
        notes.insert(note, at: 0)
        
        save()
    }
    
    func updateNote(note: Note) {
        guard let index = notes.firstIndex(where: { $0.id == note.id }) else { return }
        var updatedNote = note
        updatedNote.updatedAt = .now
        notes[index] = updatedNote
        save()
    }
    
    func deleteNote(note: Note) {
        notes.removeAll(where: { $0.id == note.id })
        save()
    }
    
    func save() {
        notes.sort { $0.updatedAt > $1.updatedAt }
        guard let data = try? JSONEncoder().encode(notes) else { return }
        UserDefaults.standard.set(data, forKey: storageKey)
        
        printNotes()
    }
    
    func printNotes() {
        guard let data = UserDefaults.standard.data(forKey: storageKey),
                let decoded = try? JSONDecoder().decode([Note].self, from: data) else { return }
        
        for note in decoded {
            print("Note title: \(note.title)")
            print("Note Content: \(note.content)")
        }
    }
    
    func load() {
        guard let data = UserDefaults.standard.data(forKey: storageKey),
                let decoded = try? JSONDecoder().decode([Note].self, from: data) else { return }
        
        notes = decoded.sorted { $0.updatedAt > $1.updatedAt }
    }
    
}
