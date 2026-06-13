//
//  ContentView.swift
//  NotesApp
//
//  Created by vinayagamoorthi on 07/06/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showDetail = false
    
    var body: some View {
        
        NavigationStack() {
            emptyState
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
                    NotesDetailView()
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
                
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ContentView()
}
