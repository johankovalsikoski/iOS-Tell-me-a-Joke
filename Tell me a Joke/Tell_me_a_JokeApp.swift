//
//  Tell_me_a_JokeApp.swift
//  Tell me a Joke
//
//  Created by Johan Kovalsikoski on 09/11/23.
//

import SwiftUI
import SwiftData

@main
struct Tell_me_a_JokeApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            JokeEntity.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
