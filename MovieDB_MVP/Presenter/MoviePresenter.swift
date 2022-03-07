//
//  MoviePresenter.swift
//  MovieDB_MVP
//
//  Created by Matheus Polonia on 07/03/22.
//

import Foundation

protocol MovieViewDelegate: NSObjectProtocol {
    
}

class MoviePresenter {
    private let movieService: MovieService
    weak private var movieViewDelegate: MovieViewDelegate?
    
    init(movieService: MovieService) {
        self.movieService = movieService
    }
    
    func setViewDelegate(movieViewDelegate: MovieViewDelegate?) {
        self.movieViewDelegate = movieViewDelegate
    }
}
