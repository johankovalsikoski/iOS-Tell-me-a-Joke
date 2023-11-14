//
//  JokeCell.swift
//  Tell me a Joke
//
//  Created by Johan Kovalsikoski on 14/11/23.
//

import SwiftUI

struct JokeCell: View {
    let setup: String
    let punchline: String
    var withDivider: Bool = true
    
    var body: some View {
        VStack {
            JokeRow(rowTitle: "Setup: ", rowContent: setup)
            if withDivider {
                Divider()
            }
            JokeRow(rowTitle: "Punchline: ", rowContent: punchline)
        }
    }
}

private struct JokeRow: View {
    let rowTitle: String
    let rowContent: String
    
    var body: some View {
        HStack {
            Text(rowTitle)
                .fontWeight(.bold)
            +
            Text(rowContent)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}

#Preview {
    JokeCell(setup: "Why 6 was afraid of 7?", punchline: "Because 7, 8, 9")
}
