//
//  TrendingTableViewController.swift
//  SeSACTMDBProject
//
//  Created by 이중원 on 2022/08/05.
//

import UIKit

import Alamofire
import SwiftyJSON
import Kingfisher


struct MovieInfo {
    let title: String
    //let releaseDate: Date
    let imageURL: String
    let rate: Double
}


class TrendingTableViewController: UITableViewController {

    var list: [MovieInfo] = []
    
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

                
    }
    
    func requestTrendMedia() {
        let APIKey = APIKey.TMDB
        
        let url = "https://api.themoviedb.org/3/trending/movie/day?api_key=\(APIKey)"
        
        AF.request(url, method: .get).validate().responseData {response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                print("하하하: \(json["results"][0]["release_date"])")
                                
                self.dateFormatter.dateFormat = "MM/dd/yyyy"

                let title = json["results"][0]["title"].stringValue
//                let release_date = json["results"][0]["release_date"].stringValue
//                var date = Date()
//                date = self.dateFormatter.date(from: release_date)!
                let poster_path = json["results"][0]["poster_path"].stringValue
                let vote_average = json["results"][0]["vote_average"].doubleValue

                let movie = MovieInfo(title: title, imageURL: poster_path, rate: vote_average)

                self.list.append(movie)
                
                self.tableView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingTableViewCell", for: indexPath) as! TrendingTableViewCell
        
        //cell.releaseDateLabel.text = dateFormatter.string(from: list[indexPath.row].releaseDate)
        cell.nameLabel.text = list[indexPath.row].title
        
        let url = URL(string: list[indexPath.row].imageURL)
        cell.imageView!.kf.setImage(with: url)
        
        return cell
    }

}

