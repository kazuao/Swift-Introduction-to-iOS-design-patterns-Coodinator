//
//  CoordinatorExampleTests.swift
//  Swift-Introduction-to-iOS-design-patterns-CoodinatorTests
//
//  Created by kazunori.aoki on 2021/10/13.
//

import XCTest
@testable import Swift_Introduction_to_iOS_design_patterns_Coodinator

class CoordinatorExampleTests: XCTestCase {

    func test_launch_deep_link() {
        let userActivity = NSUserActivity(activityType: NSUserActivityTypeBrowsingWeb)
        let url = URL(string: "https://example.coordinator.com/123456")!
        userActivity.webpageURL = url
        
        guard let event = LaunchTracker.Event.create(launchType: .userActivity(userActivity)) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(event, .deepLink(url: url))
    }
}
