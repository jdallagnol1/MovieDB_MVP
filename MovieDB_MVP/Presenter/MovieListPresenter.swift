//
//  MoviePresenter.swift
//  MovieDB_MVP
//
//  Created by Matheus Polonia on 07/03/22.
//

import Foundation

protocol MovieListViewDelegate: NSObjectProtocol {
    //??
}

class MovieListPresenter {
    private let movieService: MovieService
    weak private var movieListViewDelegate: MovieListViewDelegate?
    
    init(movieService: MovieService) {
        self.movieService = movieService
    }
    
    func setViewDelegate(movieViewDelegate: MovieListViewDelegate?) {
        self.movieListViewDelegate = movieViewDelegate
    }
}
