//
//  ServiceAPI.swift
//  GloboPlayChallange
//
//  Created by Jhenifer Dias on 27/06/23.
//

import Foundation
import UIKit

protocol ServiceAPIDelegate: AnyObject {
    func didFetchImageData(_ image: UIImage)
}

class ServiceAPI {
    
    var model = ResultMovie.self
    weak var delegate: ServiceAPIDelegate?
    
    var headers = [
        "accept": "application/json",
        "Authorization": "\(Keys.token)"
    ]
    // MARK: - Request
    
    func getRequestMovie(completion: @escaping ([ResultMovie]?, Error?) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(Keys.apiKey)") else { return }
        print(url)
        
        var request = URLRequest(url: url)

        let session = URLSession.shared
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(MovieResults.self, from: data)
                DispatchQueue.main.async {
                    completion(response.results, nil)
                    print(response.results)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }
    
    // MARK: - Request for download image
    func getImageFromBackdropPath(posterPath: String, completion: @escaping(Data?, Error?) -> Void) {
        let imageURLString = "https://image.tmdb.org/t/p/w500\(posterPath)"
        guard let imageURL = URL(string: imageURLString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: imageURL) { data, response, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
        task.resume()
    }
}
