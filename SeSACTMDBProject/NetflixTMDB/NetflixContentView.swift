//
//  NetflixContentView.swift
//  SeSACTMDBProject
//
//  Created by 이중원 on 2022/08/09.
//

import UIKit

class NetflixContentView: UIView {

    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        loadView()
        loadUI()
    }
    
    func loadView() {
        let view = UINib(nibName: "NetflixContentView", bundle: nil).instantiate(withOwner: self).first as! UIView
        view.layer.cornerRadius = 8
        self.addSubview(view)
    }
    
    func loadUI() {
//        infoButton.backgroundColor = .clear
//        infoButton.tintColor = .white
        
//        titleLabel.textColor = .white
    }
}
