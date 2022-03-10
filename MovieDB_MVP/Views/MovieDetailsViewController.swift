//
//  MovieDetailsViewController.swift
//  MovieDB_MVP
//
//  Created by João Vitor Dall Agnol Fernandes on 07/03/22.
//

import Foundation
import UIKit

class MovieDetailsViewController: UIViewController, MovieDetailsViewDelegate {
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieGenresLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var genresActivityIndicator: UIActivityIndicatorView!
    
    var movieDetailsPresenter: MovieDetailsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieDetailsPresenter?.delegate = self
        config()
        uptadeView()
    }
    
    func uptadeView() {
        DispatchQueue.main.async {
            guard let movieDetailsPresenter = self.movieDetailsPresenter else {
                return
            }
            if movieDetailsPresenter.shouldKeepLoading() {
                self.genresActivityIndicator.stopAnimating()
            } else {
                self.genresActivityIndicator.startAnimating()
            }
        }
    }
    
    func config() {
        self.movieTitleLabel.text = movieDetailsPresenter?.movie.title
        let ratingValue = movieDetailsPresenter?.movie.voteAverage ?? 0.0
        self.movieRatingLabel.text = String("\(ratingValue)")
        self.movieOverviewLabel.text = movieDetailsPresenter?.movie.overview
        self.movieGenresLabel.text = movieDetailsPresenter?.movieGenres
        let posterPath = movieDetailsPresenter?.movie.posterPath ?? ""
        let url = URL(string:"https://image.tmdb.org/t/p/w500/" + posterPath)
        self.moviePoster.load(url: url!)
    }
    
}
