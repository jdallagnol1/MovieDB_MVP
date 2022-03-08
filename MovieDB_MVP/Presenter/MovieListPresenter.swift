//
//  MoviePresenter.swift
//  MovieDB_MVP
//
//  Created by Matheus Polonia on 07/03/22.
//

import Foundation
import UIKit

protocol MovieListViewDelegate: NSObjectProtocol {
    //??
}

class MovieListPresenter {
    
    private let movieService: MovieService
    weak private var movieListViewDelegate: MovieListViewDelegate?
    
    var popularMovies: [MovieInfo] = []
    var nowPlayingMovies: [MovieInfo] = []
    
    init(movieService: MovieService) {
        self.movieService = movieService
        
        requestPopularMovies()
        requestNowPlayingMovie()
    }
    
    func setViewDelegate(movieViewDelegate: MovieListViewDelegate?) {
        self.movieListViewDelegate = movieViewDelegate
    }
    
    func requestPopularMovies() {
        movieService.popularRequest { popularMoviesList in
            self.popularMovies = popularMoviesList
        }
    }
    
    func requestNowPlayingMovie() {
        movieService.nowPlayingRequest { nowPlayingMoviesList in
            self.nowPlayingMovies = nowPlayingMoviesList
        }
    }
    
//    func loadData(tableView: UITableView) {
//        requestPopularMovies()
//        requestNowPlayingMovie()
//    }
    
}
