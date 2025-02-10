//
//  LFMUser.swift
//  LFMKit
//
//  Created by verizxn on 26/05/24.
//

public class LFMUser: LFMClass {
    public var handler: LFMKitRequests
    public var session: LFMResponseSession!
    
    public required init(handler: LFMKitRequests) {
        self.handler = handler
    }
    
    /// Get information about a user profile.
    /// - Parameters:
    ///   - username: The user to fetch info for. Defaults to the authenticated user.
    ///   - success: Success function (LFMResponseUser) -> Void
    ///   - error: (Optional) Error function (LFMError) -> Void
    public func getInfo(username: String, success: @escaping (LFMResponseUser) -> Void, error: ((LFMError) -> Void)? = nil) {
        handler.request(method: "user.getinfo", parameters: ["username": username], success: { response in
            guard let user = response.user else {
                error?(LFMError(error: -1, message: "Error: user.getinfo."))
                return
            }
            
            success(user)
        }, error: error)
    }
    
    /// Get a list of the recent tracks listened to by this user.
    /// - Parameters:
    ///   - username: The last.fm username to fetch the recent tracks of.
    ///   - page: The page number to fetch. Defaults to first page.
    ///   - from: Beginning timestamp of a range - only display scrobbles after this time, in UNIX timestamp format (integer number of seconds since 00:00:00, January 1st 1970 UTC). This must be in the UTC time zone.
    ///   - to: End timestamp of a range - only display scrobbles before this time, in UNIX timestamp format (integer number of seconds since 00:00:00, January 1st 1970 UTC). This must be in the UTC time zone.
    ///   - extended: Includes extended data in each artist, and whether or not the user has loved each track.
    ///   - limit: The number of results to fetch per page. Defaults to 50. Maximum is 200.
    ///   - success: Success function ([LFMResponseTrack]) -> Void
    ///   - error: (Optional) Error function (LFMError) -> Void
    public func getRecentTracks(username: String, page: Int? = nil, from: Int? = nil, to: Int? = nil, extended: Bool = false, limit: Int = 50, success: @escaping ([LFMResponseTrack]) -> Void, error: ((LFMError) -> Void)? = nil) {
        var params: [String: Any] = ["user": username, "limit": limit, "extended": extended]
        if let page = page {
            params["page"] = page
        }
        if let from = from,
           let to = to {
            params["from"] = from
            params["to"] = to
        }
        
        handler.request(method: "user.getrecenttracks", parameters: params, success: { response in
            guard let recenttracks = response.recenttracks else {
                error?(LFMError(error: -1, message: "Error: user.getrecenttracks."))
                return
            }
            success(recenttracks.track)
        }, error: error)
    }
    
    /// Get a list of the user's friends on Last.fm.
    /// - Parameters:
    ///   - username: The last.fm username to fetch the friends of.
    ///   - success: Success function ([LFMResponseUser]) -> Void
    ///   - error: (Optional) Error function (LFMError) -> Void
    public func getFriends(username: String, success: @escaping ([LFMResponseUser]) -> Void, error: ((LFMError) -> Void)? = nil){
        handler.request(method: "user.getfriends", parameters: ["user": username], success: { response in
            guard let friends = response.friends else {
                error?(LFMError(error: -1, message: "Error: user.getfriends."))
                return
            }
            success(friends.user)
        }, error: error)
    }
    
}
