//
//  MovieDetailsPresenter.swift
//  MovieDB_MVP
//
//  Created by João Vitor Dall Agnol Fernandes on 09/03/22.
//

import Foundation

protocol MovieDetailsViewDelegate: AnyObject {
    func uptadeView()
}

class MovieDetailsPresenter {
    let movie: MovieInfo
    var movieGenres: String = ""
    let movieService = MovieService()
    weak var delegate: MovieDetailsViewDelegate?
    
    public init(receivedMovie: MovieInfo) {
        self.movie = receivedMovie
        movieService.movieGenresRequest(movieId: movie.id) { movieGenres in
            self.movieGenres = self.toString(genresArray: movieGenres)
            self.delegate?.uptadeView()
        }
    }
    
    func toString(genresArray: [String]) -> String{
        var genresString = ""
        for genre in genresArray {
            if genre != genresArray.last {
                genresString.append(genre + ", ")
            } else {
                genresString.append(genre)
            }
        }
        return genresString
    }
    
    func shouldKeepLoading() -> Bool {
        return !movieGenres.isEmpty
    }
    
}

