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
    
//    func getPoster(posterPath: String) -> UIImageView {
//        let url = URL(string:"https://image.tmdb.org/t/p/w500/\(posterPath)")!
//        let poster = UIImageView()
//        poster.load(url: url)
//        return poster
//    }

}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
