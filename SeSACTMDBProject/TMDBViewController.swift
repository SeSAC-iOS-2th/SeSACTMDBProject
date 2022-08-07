//
//  TMDBViewController.swift
//  SeSACTMDBProject
//
//  Created by 이중원 on 2022/08/06.
//

import UIKit

import Alamofire
import SwiftyJSON
import Kingfisher

struct movieInfo {
    let movieTitle: String
    let releaseDate: String
    let backdropImageURL: String
    let rate: String
}


class TMDBViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    
    var list: [movieInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        let nibName = UINib(nibName: TMDBTableViewCell.identifier, bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: TMDBTableViewCell.identifier)
        
        requestTMDB()
    }
    
    func requestTMDB() {
        let url = "https://api.themoviedb.org/3/trending/movie/week?api_key=\(APIKey.TMDB)"
                
        AF.request(url, method: .get).validate(statusCode: 200..<300).responseData { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                for item in json["results"].arrayValue {
                    let movieTitle = item["title"].stringValue
                    let releaseDate = item["release_date"].stringValue
                    let backdropImageURL = "https://image.tmdb.org/t/p/w342\(item["backdrop_path"].stringValue)"
                    let vote_average = String(format: "%.1f", item["vote_average"].doubleValue)

                    let movie = movieInfo(movieTitle: movieTitle, releaseDate: releaseDate, backdropImageURL: backdropImageURL, rate: vote_average)
                    
                    self.list.append(movie)
                    
                    
                    }
                
                self.tableView.reloadData()
                                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TMDBTableViewCell.identifier, for: indexPath) as! TMDBTableViewCell
                
        cell.view.backgroundColor = .white
        cell.view.layer.cornerRadius = 8
        makeViewShadow(view: cell.view)
        
        cell.releaseDateLabel.text = list[indexPath.row].releaseDate
        cell.releaseDateLabel.textColor = .gray
        cell.releaseDateLabel.font = .systemFont(ofSize: 12)
        
        cell.nameLabel.text = list[indexPath.row].movieTitle
        let url = URL(string: list[indexPath.row].backdropImageURL)
        cell.backdropImageView.kf.setImage(with: url)
        cell.backdropImageView.layer.cornerRadius = 8
        cell.genreLabel.text = "#Genre"
        cell.characterLabel.text = "#등장인물"
        cell.rateLabel.text = list[indexPath.row].rate
        cell.clipButton.setImage(UIImage(systemName: "paperclip.circle.fill"), for: .normal)
        cell.clipButton.tintColor = .white
        
        return cell
    }
    
    func makeViewShadow(view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowOpacity = 0.5
    }
}



