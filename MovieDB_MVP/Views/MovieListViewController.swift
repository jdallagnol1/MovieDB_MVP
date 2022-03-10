//
//  ViewController.swift
//  MovieDB_MVP
//
//  Created by João Vitor Dall Agnol Fernandes on 04/03/22.
//

import UIKit

class MovieListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var movieListTableView: UITableView!
    
    let presenter: MovieListPresenter = MovieListPresenter(movieService: MovieService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieListTableView.dataSource = self
        movieListTableView.delegate = self
        
        // Do any additional setup after loading the view.
        DispatchQueue.main.async {
            self.movieListTableView.reloadData()
        }
    }
}

extension MovieListViewController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return presenter.popularMovies.count
        } else  {
            return presenter.nowPlayingMovies.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieListTableView.dequeueReusableCell(withIdentifier: "movieCell") as! MovieListTableViewCell
        if indexPath.section == 0 { // popular movies
            let movie = presenter.popularMovies[indexPath.row]
            cell.movieTileLabel.text = movie.title
            cell.movieDescriptionLabel.text = movie.overview
            cell.movieRatingLabel.text = String(movie.voteAverage)
            let url = URL(string:"https://image.tmdb.org/t/p/w500/\(movie.posterPath)")
            cell.moviePoster.load(url: url!)
        } else { // now playing
            let movie = presenter.nowPlayingMovies[indexPath.row]
            cell.movieTileLabel.text = movie.title
            cell.movieDescriptionLabel.text = movie.overview
            cell.movieRatingLabel.text = String(movie.voteAverage)
            let url = URL(string:"https://image.tmdb.org/t/p/w500/\(movie.posterPath)")
            cell.moviePoster.load(url: url!)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Popular Movies"
        } else {
            return "Now Playing"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 { //popular movies
            performSegue(withIdentifier: "goToMovieDetails", sender: presenter.popularMovies[indexPath.row])
        } else {
            performSegue(withIdentifier: "goToMovieDetails", sender: presenter.nowPlayingMovies[indexPath.row])
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let movieToShow = sender as! MovieInfo
        let detailView = segue.destination as! MovieDetailsViewController
        let detailPresenter = MovieDetailsPresenter(receivedMovie: movieToShow)
        detailView.movieDetailsPresenter = detailPresenter
    }
    
}
