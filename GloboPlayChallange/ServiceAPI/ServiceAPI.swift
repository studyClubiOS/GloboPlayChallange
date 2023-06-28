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
        "Authorization": "\(Keys.apiKey)"
    ]
    // MARK: - Request
    
    func getRequestMovie(completion: @escaping (ResultMovie?, Error?) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/11?api_key=\(Keys.apiKey)") else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let movie = try decoder.decode(ResultMovie.self, from: data)
                    completion(movie, nil)
                } catch {
                    completion(nil, error)
                }
            } else {
                completion(nil, NSError(domain: "No data received", code: 0, userInfo: nil))
            }
        }
        task.resume()
    }
    
    // MARK: - Request for download image
    func getImageFromBackdropPath(posterPath: String) -> UIImage? {
        let imageURLString = "https://image.tmdb.org/t/p/w500\(posterPath)"
        guard let imageURL = URL(string: imageURLString) else {
            return nil
        }
        if let imageData = try? Data(contentsOf: imageURL), let image = UIImage(data: imageData) {
            DispatchQueue.main.async {
                let imageView = UIImageView(image: image)
            }
        }
        return nil
    }
    
}
