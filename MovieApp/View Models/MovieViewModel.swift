//
//  MovieViewModel.swift
//  MovieDatabase
//
//  Created by momin on 23/09/2021.
//

import UIKit

class MovieViewModel: NSObject
{
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: OriginalLanguage
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    //dependecny injection here
    
    init(movie: Result) {
        self.adult = movie.adult
        self.backdropPath = movie.backdropPath
        self.genreIDS = movie.genreIDS
        self.id = movie.id
        self.originalLanguage = movie.originalLanguage
        self.originalTitle = movie.originalTitle
        self.overview = movie.overview
        self.popularity = movie.popularity
        self.posterPath = movie.posterPath
        self.releaseDate = movie.releaseDate
        self.title = movie.title
        self.video = movie.video
        self.voteCount = movie.voteCount
        self.voteAverage = movie.voteAverage
    }
}
