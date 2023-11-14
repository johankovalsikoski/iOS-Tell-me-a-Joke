//
//  RatingView.swift
//  Tell me a Joke
//
//  Created by Johan Kovalsikoski on 14/11/23.
//

import SwiftUI
import SwiftData

struct RatingFavoriteView: View {
    @Environment(\.modelContext) private var context
    
    @Binding var rating: Int
    var joke: JokeDto
    
    private let starImage = Image(systemName: "star.fill")
    private let selectedColor = Color.yellow
    private let unselectedColor = Color.gray
    
    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { number in
                starImage
                    .foregroundColor(
                        number > rating ? unselectedColor : selectedColor
                    ).onTapGesture {
                        rating = number
                        
                        context.insert(
                            JokeEntity(
                                setup: joke.setup, punchline: joke.punchline, rating: rating)
                        )
                    }
            }
        }
    }
}

#Preview {
    RatingFavoriteView(rating: .constant(4), joke: JokeDto(setup: "", punchline: ""))
}
