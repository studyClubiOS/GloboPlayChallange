//
//  MovieResults.swift
//  GloboPlayChallange
//
//  Created by Jhenifer Dias on 01/07/23.
//

import Foundation
import UIKit

struct MovieResults: Codable {
    
    let page: Int
    let results: [ResultMovie]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
}
