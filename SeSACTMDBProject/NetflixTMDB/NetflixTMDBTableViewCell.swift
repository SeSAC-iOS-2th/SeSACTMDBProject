//
//  NetflixTMDBTableViewCell.swift
//  SeSACTMDBProject
//
//  Created by 이중원 on 2022/08/09.
//

import UIKit

class NetflixTMDBTableViewCell: UITableViewCell {

    @IBOutlet weak var tableViewTitleLabel: UILabel!
    @IBOutlet weak var contentCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        self.backgroundColor = .clear
        tableViewTitleLabel.textColor = .white
        tableViewTitleLabel.font = UIFont.systemFont(ofSize: 16)
        
        contentCollectionView.backgroundColor = .clear
        contentCollectionView.collectionViewLayout = collectionViewLayout()
    }

    func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 130)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0)
        return layout
    }
}
