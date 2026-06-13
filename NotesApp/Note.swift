//
//  Note.swift
//  NotesApp
//
//  Created by vinayagamoorthi on 07/06/26.
//

import Foundation

struct Note: Codable {
    let id: UUID
    var title: String
    var content: String
    let createdAt: Date
    var updatedAt: Date
    
    init(title: String, content: String) {
        self.id = UUID()
        self.title = title
        self.content = content
        self.createdAt = .now
        self.updatedAt = .now
    }
}
