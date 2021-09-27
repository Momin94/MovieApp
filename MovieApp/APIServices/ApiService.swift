//
//  ApiService.swift
//  MovieDatabase
//
//  Created by momin on 22/09/2021.
//

import UIKit
import Alamofire

class ApiService: NSObject
{
    
    static let shareInstance = ApiService()
    
    func getPopularMovies(completion: @escaping ([Result], Error?)->())
    {
       let urlString =  "https://api.themoviedb.org/3/movie/popular?api_key=4c4170e285c8fd140fb81350cf566a45&page=1"
        
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url)
        {(data,response, error)in
            if let err = error
            {
                //if error during get request
                completion([], err)
                print("loading data error: \(err.localizedDescription)")
            }
            else
            {
                //if successful get request
                guard let data = data else {return}
                do {
                    var movieArray = [Result]()
                    let results = try JSONDecoder().decode(MovieModel.self, from: data)
                    for movie in results.results
                    {
                        movieArray.append(movie)
                    }
                    completion(movieArray,error)
                    
                } catch let jsonError
                {
                    print("json error \(jsonError.localizedDescription)")
                }
            }
        }.resume()
    } //eofunction
    
   

}
