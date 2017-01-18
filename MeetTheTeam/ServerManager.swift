//
//  ServerManager.swift
//  MeetTheTeam
//
//  Created by Anoop tomar on 1/17/17.
//  Copyright © 2017 Devtechie. All rights reserved.
//

import UIKit

class ServerManager {
    static var shared = ServerManager()
    private init(){}
    func jsonToObjectArray(completion: @escaping (([Team]) -> Void)){
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
            if let path = Bundle.main.url(forResource: "team", withExtension: "json") {
                var teamArr = [Team]()
                do {
                    let jsonData = try Data(contentsOf: path, options: Data.ReadingOptions.mappedIfSafe)
                    if let jsonResult = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [Dictionary<String, String>] {
                        for item in jsonResult {
                            teamArr.append(Team(avatar: item["avatar"]! as String, bio: item["bio"]! as String, firstName: item["firstName"]! as String, lastName: item["lastName"]! as String, id: item["id"]! as String, title: item["title"]! as String))
                        }
                        completion(teamArr)
                    }
                    
                } catch {
                    print(error)
                }
            }
        }
    }
}
