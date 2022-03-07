//
//  Movie.swift
//  MovieDB_MVP
//
//  Created by Matheus Polonia on 07/03/22.
//

import Foundation

struct MovieInfo: Hashable {
    let id: Int
    
    let title: String
    let overview: String
    let voteAverage: Float
    let posterPath: String
}
