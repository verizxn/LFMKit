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
    
    public func getInfo(username: String, success: @escaping (LFMResponseUser) -> Void, error: ((Int, String) -> Void)? = nil) {
        handler.request(method: "user.getinfo", parameters: ["username": username], success: { response in
            if let user = response.user {
                success(user)
            }
        }, error: error)
    }
    
    public func getRecentTracks(username: String, limit: Int, success: @escaping ([LFMResponseTrack]) -> Void, error: ((Int, String) -> Void)? = nil) {
        handler.request(method: "user.getrecenttracks", parameters: ["user": username, "limit": limit], success: { response in
            if let recenttracks = response.recenttracks {
                success(recenttracks.track)
            }
        }, error: error)
    }
    
    public func getFriends(username: String, success: @escaping ([LFMResponseUser]) -> Void, error: ((Int, String) -> Void)? = nil){
        handler.request(method: "user.getfriends", parameters: ["user": username], success: { response in
            if let friends = response.friends {
                success(friends.user)
            }
        }, error: error)

    }
    
}
