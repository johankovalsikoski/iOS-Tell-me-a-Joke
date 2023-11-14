//
//  ShowRatingView.swift
//  Tell me a Joke
//
//  Created by Johan Kovalsikoski on 14/11/23.
//

import SwiftUI

struct ShowRatingView: View {
    let rating: Int
    
    private let starImage = Image(systemName: "star.fill")
    private let selectedColor = Color.yellow
    private let unselectedColor = Color.gray
    
    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { number in
                starImage
                    .foregroundColor(
                        number > rating ? unselectedColor : selectedColor
                    )
            }
        }
    }
}

#Preview {
    ShowRatingView(rating: 4)
}
