//
//  BaseViewController.swift
//  MeetTheTeam
//
//  Created by Anoop tomar on 1/16/17.
//  Copyright © 2017 Devtechie. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red:0.14, green:0.10, blue:0.09, alpha:1.0)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
}
