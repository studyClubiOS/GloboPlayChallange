//
//  MovieViewModel.swift
//  GloboPlayChallange
//
//  Created by Jhenifer Dias on 23/06/23.
//

import Foundation
import UIKit
//
//struct MovieViewModel {
//    
//    let movie: Result
//    
//    guard let movieUrl = movie.backdropPath else { return }
//    let imageUrlString = "https://image.tmdb.org/t/p/w500\(movieUrl)"
//    
//    guard let imageUrl = URL(string: imageUrlString) else { return }
//    
//    var session = URLSession.shared
//    let dataTask = self.session.dataTask(with: imageUrl) { (data, response, error) in
//        if let error = error {
//            print("Error: \(error)")
//            return
//        }
//        
//        if let data = data, let image = UIImage(data: data) {
//            DispatchQueue.main.async {
//                imageMovie.image = image
//            }
//        }
//    }
//    
//        .resume()
//    
//}
