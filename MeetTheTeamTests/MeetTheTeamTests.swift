//
//  MeetTheTeamTests.swift
//  MeetTheTeamTests
//
//  Created by Anoop tomar on 1/16/17.
//  Copyright © 2017 Devtechie. All rights reserved.
//

import XCTest
@testable import MeetTheTeam

class MeetTheTeamTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTeamModelObject() {
        let team = Team(avatar: "dfskjl", bio: "fsdf", firstName: "sdfsf", lastName: "james", id: "0", title: "sfdsafa")
        XCTAssertEqual(team.lastName, "james")
    }
    
    func testTeamJsonResponse() {
        let exp = expectation(description: "Service response to be non-nil")
        ServerManager.shared.jsonToObjectArray { (teams) in
            XCTAssertEqual(teams.count, 19)
            exp.fulfill()
        }
        waitForExpectations(timeout: 20) { (error) in
            if let err = error {
                XCTFail("wait timed out with error: \(err)")
            }
        }
    }
    
}
