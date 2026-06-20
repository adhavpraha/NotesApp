//
//  NotesDetailView.swift
//  NotesApp
//
//  Created by vinayagamoorthi on 07/06/26.
//

import SwiftUI

struct NotesDetailView: View {
    @Environment(NoteStore.self) private var store
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String
    @State private var content: String
    
    init() {
        _title = State(initialValue: "")
        _content = State(initialValue: "")
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TextField("Title", text: $title)
                .font(.title2.bold())
                .padding(.horizontal)
                .padding(.top, 12)
            
            Divider()
                .padding(.vertical, 8)
            
            TextEditor(text: $content)
                .padding(.horizontal, 12)
        }
        .navigationTitle("New Note")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    save()
                }
                .fontWeight(.semibold)
            }
        }
    }
    
    func save() {
        store.createNote(title: title, content: content)
        dismiss()
    }
}

#Preview {
    //NotesDetailView()
}
