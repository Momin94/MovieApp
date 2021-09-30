//
//  MovieViewModel.swift
//  MovieDatabase
//
//  Created by momin on 23/09/2021.
//

import UIKit

class MovieViewModel: NSObject {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    // dependecny injection here

    init(movie: Result) {
        adult = movie.adult
        backdropPath = movie.backdropPath
        genreIDS = movie.genreIDS
        id = movie.id
        originalLanguage = movie.originalLanguage
        originalTitle = movie.originalTitle
        overview = movie.overview
        popularity = movie.popularity
        posterPath = movie.posterPath
        releaseDate = movie.releaseDate
        title = movie.title
        video = movie.video
        voteCount = movie.voteCount
        voteAverage = movie.voteAverage
    }
}
