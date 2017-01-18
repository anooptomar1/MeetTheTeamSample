//
//  Team.swift
//  MeetTheTeam
//
//  Created by Anoop tomar on 1/16/17.
//  Copyright © 2017 Devtechie. All rights reserved.
//

import Foundation
class Team {
    var avatar: String
    var bio: String
    var firstName: String
    var id: String
    var lastName: String
    var title: String
    
    init(avatar: String, bio: String, firstName: String, lastName: String, id: String, title: String) {
        self.avatar = avatar
        self.bio = bio
        self.firstName = firstName
        self.lastName = lastName
        self.id = id
        self.title = title
    }
}
