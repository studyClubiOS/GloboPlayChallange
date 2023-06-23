//
//  Service.swift
//  GloboPlayChallange
//
//  Created by Jhenifer Dias on 22/06/23.
//

import Foundation

struct APIService {
    
    func fetchDataMovieList(completion: @escaping (Data?, Error?) -> Void) {
        let headers = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiMTJjYjEyMzJlNTJiNjQ2MTI2NzBjYjUzYmZmMjNhZSIsInN1YiI6IjYzODUxMDQ1MWIxNTdkMDA4NWVjNDQ5MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ycdQFK45WiDtv_llsF2aSn8yG7ZSBY1VgX5Ps_Ah-JE"
        ]
        
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1") else {
            completion(nil, NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(nil, error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse as Any)
                completion(data, nil)
            }
        }
        
        dataTask.resume()
    }
}
