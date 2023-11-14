//
//  FuckingUseCase.swift
//  Tell me a Joke
//
//  Created by Johan Kovalsikoski on 09/11/23.
//

import Foundation

class GetRandomJokeUseCase { 
    let service = JokeService()
    
    func fetchJoke() async -> JokeDto? {
        return await service.requestRandomJoke()
    }
}
