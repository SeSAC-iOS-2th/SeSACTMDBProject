//
//  NetflixContentCollectionViewCell.swift
//  SeSACTMDBProject
//
//  Created by 이중원 on 2022/08/09.
//

import UIKit

class NetflixContentCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var netflixContentView: NetflixContentView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
        self.layer.cornerRadius = 8
    }
    
    func setupUI() {
        netflixContentView.backgroundColor = .clear
    }

}
