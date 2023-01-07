//
//  NoteDataSource.swift
//  TabBarNotes
//
//  Created by technomix on 07.01.23.
//

import Foundation

class NoteDataSource {
    static var shared = NoteDataSource()
    var notes : [Note] = []
}
