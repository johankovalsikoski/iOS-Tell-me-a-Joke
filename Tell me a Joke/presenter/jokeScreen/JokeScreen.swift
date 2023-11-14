//
//  JokeScreen.swift
//  Tell me a Joke
//
//  Created by Johan Kovalsikoski on 11/11/23.
//

import SwiftUI

struct JokeScreen: View {
    @State private var showPunchline: Bool = false
    @State private var rating = 0
    
    var viewModel: JokeViewModel
    
    var body: some View {
        NavigationStack {
            if viewModel.randomJoke != nil {
                VStack {
                    Spacer().frame(height: 16)

                    JokeCell(
                        setup: viewModel.randomJoke!.setup,
                        punchline: viewModel.randomJoke!.punchline
                    )
                    
                    Spacer().frame(height: 24)
                    
                    RatingFavoriteView(rating: $rating, joke: viewModel.randomJoke!)
                    
                    Spacer().frame(height: 8)
                    
                    Text("Rate and Favorite")
                        .font(.subheadline)
                        .foregroundStyle(.green)
                    
                    Spacer()
                    
                    Button("NEXT JOKE") {
                        Task {
                            rating = 0
                            await viewModel.getRandomJoke()
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .navigationTitle("Why so serious?")
                    .navigationBarTitleDisplayMode(.automatic)
                }
            }
        }
        .overlay {
            if viewModel.randomJoke == nil {
                ContentUnavailableView(label: {
                    Label("An error occoured", systemImage: "tray.fill")
                }, description: {
                    Text("Check your internet connection")
                }, actions: {
                    Button("TRY AGAIN") {
                        Task {
                            rating = 0
                            await viewModel.getRandomJoke()
                        }
                    }
                })
            }
        }
        .task {
            await viewModel.getRandomJoke()
        }
    }
}
//            VStack {
//                Text("Setup")
//                    .font(.headline)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//
//                Text(viewModel.randomJoke!.setup)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//
//                Divider()
//
//                Text("Punchline")
//                    .font(.headline)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//
//
//                Text(viewModel.randomJoke!.punchline)                        .frame(maxWidth: .infinity, alignment: .leading)
//
//                Spacer()
//
//                Button("Get random Joke") {
//                    Task {
//                        await viewModel.getRandomJoke()
//                    }
//                }
//            }.navigationTitle("Why so serious?")
//                .navigationBarTitleDisplayMode(.automatic)
//                .overlay {
//                    if viewModel.randomJoke == nil {
//                        Text("No Joke available, check your connection")
//                    }
//                }
//            .task {
//                await viewModel.getRandomJoke()
//            }


#Preview {
    JokeScreen(viewModel: JokeViewModel())
}
