//
//  ContentView.swift
//  NotesApp
//
//  Created by vinayagamoorthi on 07/06/26.
//

import SwiftUI

struct ContentView: View {
    @Environment(NoteStore.self) private var store
    @State private var showDetail = false
    @State var selNote: Note?
    
    var body: some View {
        
        NavigationStack() {
                Group {
                    if store.notes.isEmpty {
                        emptyState
                    } else {
                        notesList
                    }
                }
                .navigationTitle("Notes")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            showDetail = true
                        } label: {
                            Image(systemName: "square.and.pencil")
                        }
                    }
                }
                .navigationDestination(isPresented: $showDetail) {
                    NotesDetailView(note: selNote)
                }
        }
    }
    
    var emptyState: some View {
        ContentUnavailableView {
            Label("No Notes", systemImage: "note.text")
        } description: {
            Text("Tap the compose button to create your first note.")
        } actions: {
            Button("Create Note") {
                showDetail = true
            }
            .buttonStyle(.borderedProminent)
        }
    }
    
    var notesList: some View {
        List {
            ForEach(store.notes) { note in
               NoteRowView(note: note)
                    .onTapGesture {
                        selNote = note
                        showDetail = true
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(role: .destructive, action: {
                            store.deleteNote(note: note)
                        }, label: {
                            Label("Delete", systemImage: "trash")
                        })
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct NoteRowView: View {
    let note: Note
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(note.title)
                .font(.headline)
                .lineLimit(1)
            
            Text(note.content)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .lineLimit(2)
        }
        .padding(.vertical, 4)
    }
}
