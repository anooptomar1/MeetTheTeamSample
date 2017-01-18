//
//  SplashViewController.swift
//  MeetTheTeam
//
//  Created by Anoop tomar on 1/16/17.
//  Copyright © 2017 Devtechie. All rights reserved.
//

import UIKit

class SplashViewController: BaseViewController {

    lazy var loadingView: LoadingAnimation = {
        let la = LoadingAnimation(frame: CGRect.zero)
        //la.alpha = 0.0
        return la
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(loadingView)
        
        NSLayoutConstraint.activate([
            loadingView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            loadingView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            loadingView.bottomAnchor.constraint(equalTo: self.bottomLayoutGuide.topAnchor),
            loadingView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor)
        ])
        
        loadingView.startAnimation {[weak self] (finished) in
            self?.present(MainViewController(), animated: true, completion: nil)
        }
    }


}
