//
//  MainViewController.swift
//  MeetTheTeam
//
//  Created by Anoop tomar on 1/16/17.
//  Copyright © 2017 Devtechie. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var colors:[UIColor] = [.blue, .orange, .gray, .green, .brown, .red, .black, .lightGray, .white, .cyan]
    var teamData: [Team]?

    lazy var collectionV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout:layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.isPagingEnabled = true
        cv.backgroundColor = UIColor.clear
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionV.delegate = self
        collectionV.dataSource = self
        collectionV.register(TeamCell.self, forCellWithReuseIdentifier: "cell")
        self.view.addSubview(collectionV)
        
        ServerManager.shared.jsonToObjectArray { [weak self](teams) in
            self?.teamData = teams
            self?.collectionV.reloadData()
        }
        
        NSLayoutConstraint.activate([
            collectionV.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionV.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            collectionV.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor),
            collectionV.bottomAnchor.constraint(equalTo: self.bottomLayoutGuide.topAnchor)
        ])
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TeamCell
        cell.backgroundColor = UIColor.clear
        cell.team = teamData?[indexPath.item]
        cell.setupView()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height * 0.75)
    }
}
