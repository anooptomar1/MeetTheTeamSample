//
//  LoadingAnimation.swift
//  MeetTheTeam
//
//  Created by Anoop tomar on 1/16/17.
//  Copyright © 2017 Devtechie. All rights reserved.
//

import UIKit

class LoadingAnimation: BaseView {
    
    lazy var meetLabel: UILabel = {
        let ml = UILabel()
        ml.translatesAutoresizingMaskIntoConstraints = false
        ml.text = "Meet"
        ml.font = UIFont.DancingScriptFont().withSize(84)
        ml.textColor = UIColor.white
        ml.transform = CGAffineTransform(scaleX: 0, y: 0)
        return ml
    }()
    
    lazy var theLabel: UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.text = "The"
        tl.font = UIFont.DancingScriptFont().withSize(84)
        tl.textColor = UIColor.white
        tl.transform = CGAffineTransform(scaleX: 0, y: 0)
        return tl
    }()
    
    lazy var teamLabel: UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.text = "Team"
        tl.font = UIFont.DancingScriptFont().withSize(84)
        tl.textColor = UIColor.white
        tl.transform = CGAffineTransform(scaleX: 0, y: 0)
        return tl
    }()
    
    override func setupView() {
        super.setupView()
        self.addSubview(meetLabel)
        self.addSubview(theLabel)
        self.addSubview(teamLabel)
        
        NSLayoutConstraint.activate([
            meetLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            meetLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            theLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            theLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            teamLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            teamLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func startAnimation(completion: @escaping (Bool) -> Void) {
        
        UIView.animate(withDuration: 2.0, animations: {
            [weak self] in
            self?.meetLabel.transform = CGAffineTransform(scaleX: 1,y: 1)
            self?.meetLabel.alpha = 0.0
            }, completion: { (finished) in
                
                UIView.animate(withDuration: 1.0, animations: {
                    [weak self] in
                    
                    self?.theLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
                    self?.theLabel.alpha = 0.0
                    
                    }, completion: { (finished) in
                        
                        UIView.animate(withDuration: 1.0, animations: {
                            [weak self] in
                            self?.teamLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
                            self?.teamLabel.alpha = 0.0
                            }, completion: { (finished) in
                                completion(finished)
                        })
                })
        })
    }
}
