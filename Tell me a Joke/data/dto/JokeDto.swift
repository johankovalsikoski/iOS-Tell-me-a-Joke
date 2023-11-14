//
//  JokeDto.swift
//  Tell me a Joke
//
//  Created by Johan Kovalsikoski on 09/11/23.
//

import Foundation

struct JokeDto : Codable {
    let setup: String
    let punchline: String
}
