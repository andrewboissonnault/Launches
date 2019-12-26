//
//  LaunchesTests.swift
//  LaunchesTests
//
//  Created by Andrew Boissonnault on 12/19/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import XCTest
@testable import Launches
@testable import LaunchNetworking

class LaunchTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchLaunches() {
        let expectation = XCTestExpectation(description: "Fetch Launches")
        let manager = MockNetworkManager()
        manager.nextData = dataFromJsonFile(filename: .successResponse)
        manager.nextError = nil

        let api = LaunchAPI.init(networkManager: manager)

        api.fetchLaunches { (response, error) in

            XCTAssertNotNil(response, "Json is nil")
            XCTAssertNil(error, "Error is not nil")

            XCTAssertEqual(response?.launches.count, 100)
            
            guard let first = response?.launches.first else {
                XCTFail("Expected non empty launches list.")
                return
            }
            
            let expectedStart = isoFormatter.date(from: "20191224T120000Z")
            let expectedEnd = isoFormatter.date(from: "20191224T124000Z")
            let expectedNet = isoFormatter.date(from: "20191224T120302Z")
            
            XCTAssertEqual(first.id, 1212)
            XCTAssertEqual(first.name, "Proton-M/Blok DM-03 | Elektro-L No.3")
            XCTAssertEqual(first.tbddate, 4)
            XCTAssertEqual(first.tbdtime, 3)
            XCTAssertEqual(first.status, LaunchStatus.Green)
            XCTAssertEqual(first.infoURLs, ["http://www.google.com"])
            XCTAssertEqual(first.vidURLs, ["http://www.youtube.com"])
            XCTAssertEqual(first.isostart, expectedStart)
            XCTAssertEqual(first.isoend, expectedEnd)
            XCTAssertEqual(first.isonet, expectedNet)
            XCTAssertEqual(first.holdreason, "Lack of Funding")
            XCTAssertEqual(first.failreason, "Bad Materials")
            XCTAssertEqual(first.probability, 50)
            XCTAssertEqual(first.hashtag, "Launh")
            
            let agency = first.lsp
            
            XCTAssertEqual(agency.id, 96)
            XCTAssertEqual(agency.name, "Khrunichev State Research and Production Space Center")
            XCTAssertEqual(agency.abbrev, "KhSC")
            XCTAssertEqual(agency.countryCode, "RUS")
            XCTAssertEqual(agency.type, 1)
            XCTAssertEqual(agency.infoURLs, ["http://www.khrunichev.ru/main.php?lang=en"])
            XCTAssertEqual(agency.wikiURL, "http://en.wikipedia.org/wiki/Khrunichev_State_Research_and_Production_Space_Center")
            
            let location = first.location
            
            XCTAssertEqual(location.id, 10)
            XCTAssertEqual(location.name, "Baikonur Cosmodrome, Republic of Kazakhstan")
            XCTAssertEqual(location.countryCode, "KAZ")
            
            let pad = first.location.pads.first!
            
            XCTAssertEqual(pad.id, 35)
            XCTAssertEqual(pad.name, "81/24 (81P), Baikonur Cosmodrome, Kazakhstan")
            XCTAssertEqual(pad.mapURL, "http://maps.google.com/maps?q=46.071+N,+62.985+E")
            XCTAssertEqual(pad.latitude, 46.071001)
            XCTAssertEqual(pad.longitude, 62.984999)

            let rocket = first.rocket
            
            XCTAssertEqual(rocket.id, 62)
            XCTAssertEqual(rocket.name, "Proton-M/Blok DM-03")
            XCTAssertEqual(rocket.configuration, "-M/Blok DM-03")
            XCTAssertEqual(rocket.familyname, "Proton / UR-500")
            XCTAssertEqual(rocket.wikiURL, "https://en.wikipedia.org/wiki/Proton-M")
            XCTAssertEqual(rocket.infoURLs, [])
            XCTAssertEqual(rocket.imageURL, "https://s3.amazonaws.com/launchlibrary/RocketImages/placeholder_1920.png")
            XCTAssertEqual(rocket.imageSizes, [320, 480, 640, 720, 768, 800, 960, 1024, 1080, 1280, 1440, 1920])
            
            let mission = first.missions.first!
            
            XCTAssertEqual(mission.id, 866)
            XCTAssertEqual(mission.name, "Elektro-L No.3")
            XCTAssertEqual(mission.description, "Elektro-L is a series of meteorological satellites developed for the Russian Federal Space Agency by NPO Lavochkin. They are designed to capture real-time images of clouds and the Earths underlying surface, heliogeophysical measurements, collection and translating hydrometeorological and service data.")
            XCTAssertEqual(mission.type, 1)
            XCTAssertEqual(mission.wikiURL, "https://en.wikipedia.org/wiki/Elektro%E2%80%93L")
            XCTAssertEqual(mission.typeName, "Earth Science")
            
            let missionAgency = mission.agencies!.first!
            
            XCTAssertEqual(missionAgency.id, 63)
            XCTAssertEqual(missionAgency.name, "Russian Federal Space Agency (ROSCOSMOS)")
            XCTAssertEqual(missionAgency.abbrev, "RFSA")
            XCTAssertEqual(missionAgency.countryCode, "RUS")
            XCTAssertEqual(missionAgency.type, 1)
            XCTAssertEqual(missionAgency.infoURLs, ["http://en.roscosmos.ru/", "https://www.youtube.com/channel/UCOcpUgXosMCIlOsreUfNFiA", "https://twitter.com/Roscosmos", "https://www.facebook.com/Roscosmos"])
            XCTAssertEqual(missionAgency.wikiURL, "http://en.wikipedia.org/wiki/Russian_Federal_Space_Agency")
            

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }
    
    func testFetchLaunchesWithError() {
        let expectation = XCTestExpectation(description: "Fetch Launches With Error")
        let manager = MockNetworkManager()
        manager.nextData = nil
        manager.nextError = LaunchNetworkingError.networkingError

        let api = LaunchAPI.init(networkManager: manager)

        api.fetchLaunches { (response, error) in

            XCTAssertNil(response, "Json is not nil")
            XCTAssertNotNil(error, "Error is nil")

            guard let castedError = error as? LaunchNetworkingError else {
                XCTFail("Error casting to LaunchNetworkingError.")
                expectation.fulfill()
                return
            }

            if case .networkingError = castedError {
                expectation.fulfill()
            }
            else {
                XCTFail("Error was not .networkingError")
                expectation.fulfill()
                return
            }
        }

        wait(for: [expectation], timeout: 5.0)
    }

    func testFetchLaunchesWithMissingData() {
        let expectation = XCTestExpectation(description: "Fetch Launches With Missing Data")
        let manager = MockNetworkManager()
        manager.nextData = nil
        manager.nextError = nil

        let api = LaunchAPI.init(networkManager: manager, decoder: JSONDecoder())

        api.fetchLaunches { (response, error) in

            XCTAssertNil(response, "Json is not nil")
            XCTAssertNotNil(error, "Error is nil")

            guard let castedError = error as? LaunchError else {
                XCTFail("Error casting to LaunchNetworkingError.")
                expectation.fulfill()
                return
            }

            if case .missingData = castedError {
                expectation.fulfill()
                return
            }
            else {
                XCTFail("Error was not .missingData")
                expectation.fulfill()
                return
            }
        }
        wait(for: [expectation], timeout: 5.0)
    }

    func testFetchLaunchesWithSerializationError() {
        let expectation = XCTestExpectation(description: "Fetch Launches With Serialization Error")
        let manager = MockNetworkManager()
        manager.nextData = dataFromJsonFile(filename: .serializationError)
        manager.nextError = nil

        let api = LaunchAPI.init(networkManager: manager, decoder: JSONDecoder())

        api.fetchLaunches { (launchJson, error) in

            XCTAssertNil(launchJson, "Json is not nil")
            XCTAssertNotNil(error, "Error is nil")

           guard let castedError = error as? LaunchError else {
                XCTFail("Error casting to LaunchNetworkingError.")
                expectation.fulfill()
                return
            }

            if case .decodingError = castedError {
                expectation.fulfill()
                return
            }
            else {
                XCTFail("Error was not .decodingError")
                expectation.fulfill()
                return
            }
        }
        wait(for: [expectation], timeout: 5.0)
    }

}


private class MockNetworkManager : NetworkManager {
    var nextData : Data?
    var nextError : Error?
    
    override func fetchLaunches(_ completion: @escaping (Data?, Error?) -> Void) {
        completion(nextData, nextError)
    }
}
