//
//  NotesAppApp.swift
//  NotesApp
//
//  Created by vinayagamoorthi on 07/06/26.
//

import SwiftUI

@main
struct NotesAppApp: App {
    @State private var store = NoteStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(store)
        }
    }
}
