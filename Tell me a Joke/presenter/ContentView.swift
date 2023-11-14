//
//  ContentView.swift
//  Tell me a Joke
//
//  Created by Johan Kovalsikoski on 09/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            JokeScreen(viewModel: JokeViewModel()).tabItem {
                Label {
                    Text("Random Jokes")
                } icon: {
                    Image(systemName: "star.bubble.fill")
                }
            }
            
            FavoriteJokeListScreen().tabItem {
                Label {
                    Text("Favorited Jokes")
                } icon: {
                    Image(systemName: "list.star")
                }
            }
        }
    }
    
}

#Preview {
    ContentView()
}
