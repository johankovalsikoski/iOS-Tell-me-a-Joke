//
//  Item.swift
//  Tell me a Joke
//
//  Created by Johan Kovalsikoski on 09/11/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
