//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by momin on 24/09/2021.
//

import UIKit
import SDWebImage
class MovieDetailsViewController: UIViewController {

    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var movieGenre: UILabel!
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var movieOverview: UILabel!
    @IBOutlet var movieDate: UILabel!
    var movieGenreText: String?
    var movieTitleText: String?
    var movieOverviewText: String?
    var movieDateText: String?
    var movieImageText: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        movieGenre?.text = movieGenreText
        movieTitle?.text = movieTitleText
        movieDate?.text = movieDateText
        movieOverview?.text = movieOverviewText
        
//        let imageURL = URL(string: "https://image.tmdb.org/t/p/w500/\(String(describing: movieImageText))")
//        movieImage.sd_setImage(with: imageURL)
//
       
        
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let imageURL = URL(string: movieImageText!)
        
        
        movieImage.sd_setImage(with: imageURL) { (image, error, cache, urls) in
                    if (error != nil) {
                        // Failed to load image
                        self.movieImage.image = UIImage(named: "TestImage.jpg")
                    } else {
                        // Successful in loading image
                        self.movieImage.image = image
                    }
                }
        
//        movieImage.sd_setImage(
//             with: imageURL,
//             placeholderImage: UIImage(named: "App-Default"),
//             options: SDWebImageOptions(rawValue: 0),
//             completed: {  image, error, cacheType, imageURL in
//                          // your rest code
//                    print(error)
//
//                }
//        )

    //    movieImage.sd_setImage(with: imageURL)

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
       
    }
}
