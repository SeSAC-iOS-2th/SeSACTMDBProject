//
//  TMDBTableViewCell.swift
//  SeSACTMDBProject
//
//  Created by 이중원 on 2022/08/06.
//

import UIKit

class TMDBTableViewCell: UITableViewCell {

    static let identifier = "TMDBTableViewCell"
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var characterLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var clipButton: UIButton!
}
