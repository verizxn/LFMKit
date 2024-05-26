//
//  LFMUser.swift
//  LFMKit
//
//  Created by @verizxn on 26/05/24.
//

public struct LFMUser: LFMClass {
    public var handler: LFMKitRequests!
    public var session: LFMResponseSession!
    
    public init(handler: LFMKitRequests) {
        self.handler = handler
    }
    
    public func getInfo(username: String, success: @escaping (LFMResponseUser) -> Void, error: @escaping (Int, String) -> Void) {
        handler.request(method: "user.getinfo", parameters: ["username": username], success: { response in
            if let user = response.user {
                success(user)
            }
        }, error: { n, d in
            error(n, d)
        })
    }
    
    public func getRecentTracks(username: String, limit: Int, success: @escaping ([LFMResponseTrack]) -> Void, error: @escaping (Int, String) -> Void) {
        handler.request(method: "user.getrecenttracks", parameters: ["user": username, "limit": limit]) { response in
            if let recenttracks = response.recenttracks {
                success(recenttracks.track)
            }
        } error: { n, d in
            error(n, d)
        }
    }
    
    public func getFriends(username: String, success: @escaping ([LFMResponseUser]) -> Void, error: @escaping (Int, String) -> Void){
        handler.request(method: "user.getfriends", parameters: ["user": username]) { response in
            if let friends = response.friends {
                success(friends.user)
            }
        } error: { n, d in
            error(n, d)
        }

    }
    
}
