//
//  LFMKitTests.example.swift
//  LFMKit
//
//  Created by @verizxn on 26/05/24.
//

import XCTest
import LFMKit

final class LFMKitTests: XCTestCase {
    private let username = "YOUR_USERNAME"
    private var api = LFMKitAPI(api_key: "API_KEY", api_secret: "API_SECRET")
    private let error_callback: (LFMError) -> Void = { error in
        print("\nERROR: \(error.message)\n")
    }
    
    func testUser() throws {
        let exp = expectation(description: "User")
        api.user.getInfo(username: username, success: { response in
            print("\n\(response.realname) (@\(response.name))'s profile:")
            exp.fulfill()
        }, error: error_callback)
        waitForExpectations(timeout: 5)
    }
    
    func testTracks() throws {
        let exp = expectation(description: "Tracks")
        api.user.getRecentTracks(username: username, limit: 5, success: { tracks in
            print("Recent tracks:\n====================")
            for track in tracks {
                var nowPlaying = "[NOW] "
                if let _ = track.date {
                    nowPlaying = ""
                }
                
                print("\(nowPlaying)\(track.artist.text!) - \(track.name) [\(track.album!.text!)]")
            }
            print("====================\n")
            exp.fulfill()
        }, error: error_callback)
        waitForExpectations(timeout: 5)
    }
    
    func testFriends() throws {
        let exp = expectation(description: "Friends")
        api.user.getFriends(username: username, success: { friends in
            print("Friends:\n====================")
            for friend in friends {
                print("- @\(friend.name)")
            }
            print("====================\n")
            exp.fulfill()
        }, error: error_callback)
        waitForExpectations(timeout: 5)
    }
    
    func testTrack() throws {
        let exp = expectation(description: "Track")
        
        api.track.getInfo(track: "360", artist: "Charli XCX", username: username, success: { track in
            print("Track info:\n====================")
            print("\(track.artist.name!) - \(track.name) [\(track.album!.title)] \(track.userplaycount!)/\(track.playcount)")
            print("====================\n")
            exp.fulfill()
        }, error: error_callback)
        waitForExpectations(timeout: 5)
    }
    
    func testSearch() throws {
        let exp = expectation(description: "Search")
        
        api.track.search(query: "360 Charli XCX", limit: 2, success: { results in
            print("Search:\n====================")
            for track in results.trackmatches.track {
                print("\(track.artist) - \(track.name)")
            }
            print("====================\n")
            exp.fulfill()
        }, error: error_callback)
        waitForExpectations(timeout: 5)
    }
    
    func testSession() throws {
        let exp = expectation(description: "Session")
        
        print(api.auth.getLogin(callback: "myapp://"))
        
        api.auth.getSession(token: "YOUR_TOKEN", success: { session in
            print(session.name)
            print(session.key)
            print(session.subscriber)
            
            self.api.setSession(session: session)
            exp.fulfill()
        }, error: error_callback)
        waitForExpectations(timeout: 5)
    }
    
    func testNowPlaying() throws {
        let exp = expectation(description: "Now Playing")
        
        let session = LFMResponseSession(name: username, key: "YOUR_SESSION_KEY", subscriber: 0)
        api.setSession(session: session)
        
        api.track.updateNowPlaying(artist: "Charli XCX", track: "360", album: "BRAT", success: {
            exp.fulfill()
        }, error: error_callback)
        waitForExpectations(timeout: 5)
    }
    
    func testScrobble() throws {
        let exp = expectation(description: "Scrobbler")
        
        let session = LFMResponseSession(name: username, key: "YOUR_SESSION_KEY", subscriber: 0)
        api.setSession(session: session)
        
        api.track.scrobble(artist: "Charli XCX", track: "360", timestamp: Date().timeIntervalSince1970, album: "BRAT", album_artist: nil, success: {
            exp.fulfill()
        }, error: error_callback)
        waitForExpectations(timeout: 5)
    }
}
