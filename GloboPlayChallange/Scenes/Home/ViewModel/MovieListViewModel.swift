//
//  MovieViewModel.swift
//  GloboPlayChallange
//
//  Created by Jhenifer Dias on 23/06/23.
//

import Foundation
import UIKit

class MovieListViewModel {
    private var movies: [ResultMovie] = []
    private let movieService = ServiceAPI()

    func fetchMovies(completion: @escaping (Result<Void, Error>) -> Void) {
        movieService.getRequestMovie { [weak self] movie, error in
            if let movie = movie {
                self?.movies = [movie]
                completion(.success(()))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }

    func numberOfMovies() -> Int {
        return movies.count
    }

    func movieViewModel(at index: Int) -> MovieViewModel {
        let movie = movies[index]
        return MovieViewModel(movie: movie)
    }

    func itemSize() -> CGSize {
        return CGSize(width: 100.0, height: 150.0)
    }
}

