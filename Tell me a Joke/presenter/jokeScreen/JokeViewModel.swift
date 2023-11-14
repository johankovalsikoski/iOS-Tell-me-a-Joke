//
//  JokeViewModel.swift
//  Tell me a Joke
//
//  Created by Johan Kovalsikoski on 11/11/23.
//

import Foundation

@Observable class JokeViewModel {
    
    private let jokeService = JokeService()
    
    var randomJoke: JokeDto?
    
    func getRandomJoke() async {
        randomJoke = await jokeService.requestRandomJoke()
    }
}
