//
//  JokeEntity.swift
//  Tell me a Joke
//
//  Created by Johan Kovalsikoski on 09/11/23.
//

import Foundation
import SwiftData

@Model
final class JokeEntity {
    let date: Date
    let setup: String
    let punchline: String
    let rating: Int
    
    init(setup: String, punchline: String, rating: Int) {
        self.date = .now
        self.setup = setup
        self.punchline = punchline
        self.rating = rating
    }
}
