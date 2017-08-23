//
//  Movie.swift
//  TheMovieList
//
//  Created by Tyler Perkins on 8/23/17.
//  Copyright © 2017 Tyler Perkins. All rights reserved.
//

import Foundation


struct Movie {
    
    let moviePosterImage: String
    let movieTitle: String
    let movieYear: String
    let movieRuntime: String
    let movieDirector: String
    let movieTag: String
    let movieDescription: String
    
    init(posterImage: String, title: String, year: String, runtime: String, director: String, tag: String, description: String) {
        self.moviePosterImage = posterImage
        self.movieTitle = title
        self.movieYear = year
        self.movieRuntime = runtime
        self.movieDirector = director
        self.movieTag = tag
        self.movieDescription = description
    }
    
    
    
    
    
    
}
