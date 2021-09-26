//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by momin on 24/09/2021.
//

import UIKit

class MovieDetailsViewController: UINavigationController {

//    var movieImage = UIImageView()
//    var movieTitle = UILabel()
//    var movieGenre = UILabel()
//    var movieOverview = UILabel()
//    var movieDate = UILabel()
//
    
    @IBOutlet var movieImage : UIImageView!
    @IBOutlet var movieTitle : UILabel!
    @IBOutlet var movieGenre : UILabel!
    @IBOutlet var movieOverview : UILabel!
    @IBOutlet var movieDate : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//    }
    
    override func viewWillAppear(_ animated: Bool)
    {
       // movieTitle.text =
    }
}
