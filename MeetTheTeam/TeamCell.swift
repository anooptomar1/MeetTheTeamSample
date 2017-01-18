//
//  TeamCell.swift
//  MeetTheTeam
//
//  Created by Anoop tomar on 1/17/17.
//  Copyright © 2017 Devtechie. All rights reserved.
//

import UIKit

class TeamCell: UICollectionViewCell {
    
    var team: Team? {
        didSet {
            if let t = team {
                bView.loadImageUsingUrlString(urlString: t.avatar)
                nameLabel.text = "\(t.firstName) \(t.lastName)"
                titleLabel.text = t.title
                bioLabel.text = t.bio
            }
        }
    }
    
    var detailView = false
    
    lazy var bView: UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 4
        v.contentMode = .scaleAspectFill
        v.image = UIImage(named: "placeholder")
        v.layer.masksToBounds = true
        v.layer.borderColor = UIColor.white.cgColor
        v.layer.borderWidth = 2.0
        return v
    }()
    
    lazy var nameView: UIView = {
        let n = UIView()
        n.translatesAutoresizingMaskIntoConstraints = false
        n.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        return n
    }()
    
    lazy var nameLabel: UILabel = {
        let n = UILabel()
        n.translatesAutoresizingMaskIntoConstraints = false
        n.textColor = UIColor(red:0.14, green:0.10, blue:0.09, alpha:1.0)
        n.font = UIFont.DancingScriptFont().withSize(25)
        n.text = "Stephen Brandon"
        return n
    }()
    
    lazy var dView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.lightGray
        v.alpha = 0.0
        v.layer.masksToBounds = true
        v.layer.cornerRadius = 4
        return v
    }()
    
    lazy var titleView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor(red:1.00, green:0.77, blue:0.04, alpha:1.0)
        v.layer.cornerRadius = 50
        v.layer.borderColor = UIColor.white.cgColor
        v.layer.borderWidth = 2.0
        v.layer.masksToBounds = true
        return v
    }()
    
    lazy var titleLabel: UILabel = {
        let t = UILabel()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.textColor = UIColor.white
        t.font = UIFont.DancingScriptFont().withSize(16)
        t.numberOfLines = 0
        t.lineBreakMode = .byWordWrapping
        t.textAlignment = .center
        return t
    }()
    
    lazy var bioLabel: UITextView = {
        let l = UITextView()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.isEditable = false
        l.font = UIFont.DancingScriptFont().withSize(14)
        l.textColor = UIColor.white
        l.isScrollEnabled = true
        l.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        l.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        l.layer.cornerRadius = 2
        l.showsHorizontalScrollIndicator = false
        return l
    }()
    
    func setupView() {
        self.addSubview(dView)
        self.addSubview(bView)
        bView.addSubview(nameView)
        nameView.addSubview(nameLabel)
        dView.addSubview(titleView)
        dView.addSubview(bioLabel)
        titleView.addSubview(titleLabel)
        
        // tap gesture
        let tap = UITapGestureRecognizer(target: self, action: #selector(TeamCell.handleTapGesture))
        self.addGestureRecognizer(tap)
        setConstraintsForView()
    }
    
    private func collapsedState() {
        bView.center.y += 100
        detailView = false
        dView.alpha = 0.0
        dView.transform = CGAffineTransform.identity
        bView.transform = CGAffineTransform.identity
    }
    
    private func expandedState() {
        bView.center.y -= 100
        detailView = true
        dView.alpha = 1.0
        dView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        let rotate = CGAffineTransform(rotationAngle: -CGFloat(Float.pi / 12))
        bView.transform = rotate.scaledBy(x: 0.5, y: 0.5).translatedBy(x: -120, y: -120)
    }

    func handleTapGesture() {
        if detailView {
            UIView.animate(withDuration: 0.7, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.9, options: UIViewAnimationOptions.curveEaseOut, animations: {
                [weak self] in
                    self?.collapsedState()
                }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.9, options: UIViewAnimationOptions.curveEaseOut, animations: {
                [weak self] in
                    self?.expandedState()
                }, completion: nil)
           
        }
    }
    
    func setConstraintsForView() {
        NSLayoutConstraint.activate([
            bView.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.75),
            bView.widthAnchor.constraint(equalToConstant: self.bounds.width * 0.75),
            bView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            bView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameView.heightAnchor.constraint(equalToConstant: 40),
            nameView.leadingAnchor.constraint(equalTo: bView.leadingAnchor),
            nameView.trailingAnchor.constraint(equalTo: bView.trailingAnchor),
            nameView.bottomAnchor.constraint(equalTo: bView.bottomAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: nameView.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: nameView.centerYAnchor),
            dView.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.75),
            dView.widthAnchor.constraint(equalToConstant: self.bounds.width * 0.75),
            dView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleView.widthAnchor.constraint(equalToConstant: 100),
            titleView.heightAnchor.constraint(equalToConstant: 100),
            titleView.trailingAnchor.constraint(equalTo: dView.trailingAnchor, constant: -10),
            titleView.topAnchor.constraint(equalTo: dView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: titleView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: titleView.trailingAnchor, constant: -8),
            titleLabel.topAnchor.constraint(equalTo: titleView.topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: titleView.bottomAnchor, constant: -8),
            bioLabel.trailingAnchor.constraint(equalTo: dView.trailingAnchor, constant: -8),
            bioLabel.leadingAnchor.constraint(equalTo: dView.leadingAnchor, constant: 8),
            bioLabel.bottomAnchor.constraint(equalTo: dView.bottomAnchor, constant: -8),
            bioLabel.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 50),
            ])
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        self.collapsedState()
    }
    
}
