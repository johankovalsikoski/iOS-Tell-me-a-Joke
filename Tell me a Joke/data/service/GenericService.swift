//
//  JokeService.swift
//  Tell me a Joke
//
//  Created by Johan Kovalsikoski on 09/11/23.
//

import Foundation
//import Alamofire
import Observation

class GenericService {
    //    fileprivate var baseUrl = "https://official-joke-api.appspot.com/"
    
    func fetch<Model>(url: URL) async -> [Model] where Model: Decodable {
        do {
            let (data, _ ) = try await URLSession.shared.data(from: url)
            let decodedData = try JSONDecoder().decode([Model].self, from: data)
            return decodedData
        } catch {
            return []
        }
    }
    
    func fetch<Model>(url: URL) async -> Model? where Model: Decodable {
        do {
            let (data, _ ) = try await URLSession.shared.data(from: url)
            let decodedData = try JSONDecoder().decode(Model.self, from: data)
            return decodedData
        } catch {
            return nil
        }
    }
    
//    func getRandomJoke() async -> Void {
//            AF.request(self.baseUrl + "random_joke", method: .get, encoding: URLEncoding.default).response { response in
//                guard let data = response.data else { return }
//    
//                do {
//                    let jokeDto = try JSONDecoder().decode(JokeDto.self, from: data)
//                    print("Response: \(jokeDto)")
//    
//                    self.fuckingiOSDevelopment = jokeDto
//                } catch {
//                    print("Error: \(error)")
//                    self.fuckingiOSDevelopment = nil
//    
//                }
//            }
//    }
    
}
