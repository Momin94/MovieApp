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
    @objc func buttonAction(sender: UIButton!) {
       print("Button tapped")
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
    
    
    //WHY ARE THESE NOT WORKING???
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?, indexPath: IndexPath)
    {
        if segue.identifier == "moviedetail"
        {
            if let destinationVC = segue.destination as? MovieDetailTableViewController
            {
            
                destinationVC.movieDate.text = MovieVMarray[indexPath.row].releaseDate
                destinationVC.movieGenre.text = MovieVMarray[indexPath.row].genreIDS.description
                let imageURL = URL(string: "https://image.tmdb.org/t/p/w500/\(MovieVMarray[indexPath.row].posterPath)")
                destinationVC.movieImage.sd_setImage(with: imageURL )
                destinationVC.movieOverview.text = MovieVMarray[indexPath.row].overview
                destinationVC.movieTitle.text = MovieVMarray[indexPath.row].title
            }
        }
        if segue.identifier == "MovielistSegue"
        {
            if let destinationVC = segue.destination as? MovieDetailTableViewController
            {
                destinationVC.movieDate.text = MovieVMarray[indexPath.row].releaseDate
                destinationVC.movieGenre.text = MovieVMarray[indexPath.row].genreIDS.description
                let imageURL = URL(string: "https://image.tmdb.org/t/p/w500/\(MovieVMarray[indexPath.row].posterPath)")
                destinationVC.movieImage.sd_setImage(with: imageURL )
                destinationVC.movieOverview.text = MovieVMarray[indexPath.row].overview
                destinationVC.movieTitle.text = MovieVMarray[indexPath.row].title
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if  segue.identifier == "moviedetail",
            let destination = segue.destination as? MovieDetailsViewController,
            let movieIndex = tableView.indexPathForSelectedRow?.row
        {
            destination.movieDate.text = MovieVMarray[movieIndex].releaseDate
            destination.movieGenre.text = MovieVMarray[movieIndex].genreIDS.description
            let imageURL = URL(string: "https://image.tmdb.org/t/p/w500/\(MovieVMarray[movieIndex].posterPath)")
            destination.movieImage.sd_setImage(with: imageURL )
            destination.movieOverview.text = MovieVMarray[movieIndex].overview
            destination.movieTitle.text = MovieVMarray[movieIndex].title
            
        }
    }

}
