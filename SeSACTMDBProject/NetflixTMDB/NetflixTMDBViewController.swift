//
//  NetflixTMDBViewController.swift
//  SeSACTMDBProject
//
//  Created by 이중원 on 2022/08/09.
//

import UIKit

class NetflixTMDBViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let tableViewTitle: [String] = ["아는 와이프와 비슷한 컨텐츠", "미스터 선샤인과 비슷한 콘텐츠", "액션 SF", "미국 TV 프로그램"]
    
    let movieTitle: [String] = ["부산행", "카터", "탑건", "그레이맨", "달의 연인", "괴물", "이태원 클라쓰", "시그널", "환혼", "인사이더", "샌드맨", "워킹데드", "퍼플 하트"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate =  self
        tableView.dataSource = self
        tableView.backgroundColor = .black
        
    }
    


}

extension NetflixTMDBViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewTitle.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NetflixTMDBTableViewCell", for: indexPath) as? NetflixTMDBTableViewCell else { return UITableViewCell() }
        
        cell.tableViewTitleLabel.text = tableViewTitle[indexPath.section]
        
        cell.contentCollectionView.delegate = self
        cell.contentCollectionView.dataSource = self
        cell.contentCollectionView.register(UINib(nibName: "NetflixContentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NetflixContentCollectionViewCell")

        
        return cell
    }
     
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
}

extension NetflixTMDBViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieTitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NetflixContentCollectionViewCell", for: indexPath) as? NetflixContentCollectionViewCell else { return UICollectionViewCell() }
        
        cell.netflixContentView.titleLabel.text = movieTitle.randomElement()
        
        return cell
    }
    
    
    
}
