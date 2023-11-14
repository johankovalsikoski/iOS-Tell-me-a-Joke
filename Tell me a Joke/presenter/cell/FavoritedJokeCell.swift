//
//  FavoritedJokeCell.swift
//  Tell me a Joke
//
//  Created by Johan Kovalsikoski on 14/11/23.
//

import SwiftUI

struct FavoritedJokeCell: View {
    let joke: JokeEntity
    
    var body: some View {
        VStack {
            JokeCell(setup: joke.setup, punchline: joke.punchline, withDivider: false)
            
            HStack {
                Text("Rating: ")
                    .bold()
                ShowRatingView(rating: joke.rating)
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        }
    }
}

#Preview {
    FavoritedJokeCell(
        joke: JokeEntity(
            setup: "What gets wetter the more it dries?",
            punchline: "A towel",
            rating: 4
        )
    )
}
