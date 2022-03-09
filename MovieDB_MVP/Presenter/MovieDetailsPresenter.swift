//
//  MovieDetailsPresenter.swift
//  MovieDB_MVP
//
//  Created by João Vitor Dall Agnol Fernandes on 09/03/22.
//

import Foundation

class MovieDetailsPresenter {
    let movie: MovieInfo
    
    public init(receivedMovie: MovieInfo) {
        self.movie = receivedMovie
    }
}

