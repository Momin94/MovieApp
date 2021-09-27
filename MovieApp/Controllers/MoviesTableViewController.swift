//
//  MoviesTableViewController.swift
//  MovieApp
//
//  Created by momin on 23/09/2021.
//

import UIKit

import SDWebImage



class MoviesTableViewController: UITableViewController {

    @IBOutlet weak var MovieTable: UITableView!
    var MovieVMarray = [MovieViewModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "movieCell")
       
       

        
        self.getData()
        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    

    func getData()
    {
        ApiService.shareInstance.getPopularMovies {(movies, error) in
            if (error == nil)
          {
                self.MovieVMarray = movies.map({ return MovieViewModel(movie: $0) })
                DispatchQueue.main.async {
                    self.MovieTable.reloadData()
                }
          }
            else{
                print(movies)
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieVMarray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        let MVM = MovieVMarray[indexPath.row]
        let imageURL = URL(string: "https://image.tmdb.org/t/p/w500/\(MVM.posterPath)")!
        cell.imageView?.sd_setImage(with: imageURL)
        cell.textLabel?.text = MVM.title
        cell.accessoryType = .detailDisclosureButton
                return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationController = storyboard.instantiateViewController(withIdentifier: "moviedetail") as! MovieDetailsViewController
        let movieIndex = indexPath.row
        
        destinationController.movieGenreText = MovieVMarray[movieIndex].genreIDS.description
        
        destinationController.movieDateText = MovieVMarray[movieIndex].releaseDate
        destinationController.movieOverviewText = MovieVMarray[movieIndex].overview
        destinationController.movieTitleText = MovieVMarray[movieIndex].title
        let imageURL = "https://image.tmdb.org/t/p/w500/\(MovieVMarray[movieIndex].posterPath)"
        destinationController.movieImageText = imageURL
        
        self.navigationController?.show(destinationController, sender: self)
        
    }

}
