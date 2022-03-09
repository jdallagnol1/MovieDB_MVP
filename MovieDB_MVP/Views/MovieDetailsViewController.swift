//
//  MovieDetailsViewController.swift
//  MovieDB_MVP
//
//  Created by João Vitor Dall Agnol Fernandes on 07/03/22.
//

import Foundation
import UIKit

class MovieDetailsViewController: UIViewController {
        
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieGenresLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!
    
    var movieDetailsPresenter: MovieDetailsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        print(" titulo do filme:  \(movieDetailsPresenter?.movie.title)")
    }
    
    func config() {
        self.movieTitleLabel.text = movieDetailsPresenter?.movie.title
        self.movieRatingLabel.text = String("\(movieDetailsPresenter?.movie.voteAverage)")
        self.movieOverviewLabel.text = movieDetailsPresenter?.movie.overview
        
        
        let posterPath = movieDetailsPresenter?.movie.posterPath ?? ""
        let url = URL(string:"https://image.tmdb.org/t/p/w500/" + posterPath)
        self.moviePoster.load(url: url!)
        
        //to do image e genres
    }
    
}
