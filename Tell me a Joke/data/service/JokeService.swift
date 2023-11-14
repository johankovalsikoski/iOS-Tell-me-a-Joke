//
//  JokeService.swift
//  Tell me a Joke
//
//  Created by Johan Kovalsikoski on 11/11/23.
//

import Foundation

class JokeService {
    fileprivate var baseUrl = "https://official-joke-api.appspot.com/"
    private let baseService = GenericService()
    
    func requestRandomJoke() async -> JokeDto? {
        let randomJokeEndpoint = URL(string: baseUrl + "random_joke")
        
        return await baseService.fetch(url: randomJokeEndpoint!)
    }
}
