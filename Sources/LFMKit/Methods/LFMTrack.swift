//
//  LFMTrack.swift
//  LFMKit
//
//  Created by @verizxn on 26/05/24.
//

public struct LFMTrack: LFMClass {
    public var handler: LFMKitRequests!
    public var session: LFMResponseSession!
    
    public init(handler: LFMKitRequests) {
        self.handler = handler
    }
    
    public func getInfo(track: String, artist: String, username: String? = nil, success: @escaping (LFMResponseTrackFull) -> Void, error: ((Int, String) -> Void)? = nil){
        var params = ["track": track, "artist": artist]
        if let user = username {
            params["username"] = user
        }
        
        handler.request(method: "track.getinfo", parameters: params, success: { response in
            if let track = response.track {
                success(track)
            }
        }, error: error)
    }
    
    public func getInfo(mbid: String, username: String? = nil, success: @escaping (LFMResponseTrackFull) -> Void, error: ((Int, String) -> Void)? = nil){
        var params = ["mbid": mbid]
        if let user = username {
            params["username"] = user
        }
        
        handler.request(method: "track.getinfo", parameters: params, success: { response in
            if let track = response.track {
                success(track)
            }
        }, error: error)
    }
    
    public func search(track: String, artist: String, limit: Int, success: @escaping (LFMResponseTrackResults) -> Void, error: ((Int, String) -> Void)? = nil){
        handler.request(method: "track.search", parameters: ["track": track, "artist": artist, "limit": limit], success: { response in
            if let results = response.results {
                success(results)
            }
        }, error: error)
    }
    
    public func search(query: String, limit: Int, success: @escaping (LFMResponseTrackResults) -> Void, error: ((Int, String) -> Void)? = nil){
        handler.request(method: "track.search", parameters: ["track": query, "limit": limit], success: { response in
            if let results = response.results {
                success(results)
            }
        }, error: error)
    }
    
    public func updateNowPlaying(artist: String, track: String, album: String, success: @escaping () -> Void, error: ((Int, String) -> Void)? = nil){
        handler.request(method: "track.updatenowplaying", parameters: ["artist": artist, "track": track, "album": album, "sk": session.key], success: { _ in
            success()
        }, error: error, requiresSignature: true, type: .post)
    }
    
    public func updateNowPlaying(mbid: String, success: @escaping () -> Void, error: ((Int, String) -> Void)? = nil){
        handler.request(method: "track.updatenowplaying", parameters: ["mbid": mbid, "sk": session.key], success: { _ in
            success()
        }, error: error, requiresSignature: true, type: .post)
    }
    
    public func scrobble(artist: String, track: String, timestamp: Double, album: String, album_artist: String?, success: @escaping () -> Void, error: ((Int, String) -> Void)? = nil){
        handler.request(method: "track.scrobble", parameters: ["artist": artist, "track": track, "timestamp": timestamp, "album": album, "albumArtist": album_artist ?? artist, "sk": session.key], success: { response in
            success()
        }, error: error, requiresSignature: true, type: .post)
    }
    
    public func scrobble(mbid: String, success: @escaping () -> Void, error: ((Int, String) -> Void)? = nil){
        handler.request(method: "track.scrobble", parameters: ["mbid": mbid, "sk": session.key], success: { response in
            success()
        }, error: error, requiresSignature: true, type: .post)
    }
    
}
