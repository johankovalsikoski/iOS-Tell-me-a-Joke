//
//  FavoriteJokeListScreen.swift
//  Tell me a Joke
//
//  Created by Johan Kovalsikoski on 11/11/23.
//

import SwiftUI
import SwiftData

struct FavoriteJokeListScreen: View {
    @Environment(\.modelContext) private var context
    
    @Query(sort: \JokeEntity.rating, order: .reverse, animation: .default) private var jokeList: [JokeEntity]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(jokeList) { joke in
                    FavoritedJokeCell(joke: joke)
                }.onDelete(perform: { indexSet in
                    for index in indexSet {
                        context.delete(jokeList[index])
                    }
                })
            }
        }.overlay {
            if jokeList.isEmpty {
                ContentUnavailableView(label: {
                    Label("Favorite Jokes", systemImage: "tray.fill")
                }, description: {
                    Text("You don't have jokes favorited")
                })
            }
        }
    }
}

#Preview {
    FavoriteJokeListScreen()
}
