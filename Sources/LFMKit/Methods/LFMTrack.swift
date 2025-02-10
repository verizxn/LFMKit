//
//  LFMTrack.swift
//  LFMKit
//
//  Created by verizxn on 26/05/24.
//

public class LFMTrack: LFMClass {
    public var handler: LFMKitRequests
    public var session: LFMResponseSession!
    
    public required init(handler: LFMKitRequests) {
        self.handler = handler
    }
    
    /// Get the metadata for a track on Last.fm using the artist/track name.
    /// - Parameters:
    ///   - track: The track name.
    ///   - artist: The artist name.
    ///   - username: (Optional) The username for the context of the request. If supplied, the user's playcount for this track and whether they have loved the track is included in the response.
    ///   - success: Success function (LFMResponseTrackFull) -> Void
    ///   - error: (Optional) Error function (LFMError) -> Void
    public func getInfo(track: String, artist: String, username: String? = nil, success: @escaping (LFMResponseTrackFull) -> Void, error: ((LFMError) -> Void)? = nil){
        var params = ["track": track, "artist": artist]
        if let user = username {
            params["username"] = user
        }
        
        handler.request(method: "track.getinfo", parameters: params, success: { response in
            guard let track = response.track else {
                error?(LFMError(error: -1, message: "Error: track.getinfo."))
                return
            }
            success(track)
        }, error: error)
    }
    
    /// Get the metadata for a track on Last.fm using a musicbrainz id.
    /// - Parameters:
    ///   - mbid: The musicbrainz id for the track.
    ///   - username: (Optional) The username for the context of the request. If supplied, the user's playcount for this track and whether they have loved the track is included in the response.
    ///   - success: Success function (LFMResponseTrackFull) -> Void
    ///   - error: (Optional) Error function (LFMError) -> Void
    public func getInfo(mbid: String, username: String? = nil, success: @escaping (LFMResponseTrackFull) -> Void, error: ((LFMError) -> Void)? = nil){
        var params = ["mbid": mbid]
        if let user = username {
            params["username"] = user
        }
        
        handler.request(method: "track.getinfo", parameters: params, success: { response in
            guard let track = response.track else {
                error?(LFMError(error: -1, message: "Error: track.getinfo."))
                return
            }
            success(track)
        }, error: error)
    }
    
    /// Search for a track by track name. Returns track matches sorted by relevance.
    /// - Parameters:
    ///   - track: (Optional) The track name.
    ///   - artist: (Optional) Narrow your search by specifying an artist.
    ///   - limit: (Optional) The number of results to fetch per page. Defaults to 30.
    ///   - success: Success function (LFMResponseTrackResults) -> Void
    ///   - error: (Optional) Error function (LFMError) -> Void
    public func search(track: String? = nil, artist: String? = nil, limit: Int = 30, success: @escaping (LFMResponseTrackResults) -> Void, error: ((LFMError) -> Void)? = nil){
        var params: [String: Any] = ["limit": limit]
        if let track = track {
            params["track"] = track
        }
        if let artist = artist {
            params["artist"] = artist
        }
        
        handler.request(method: "track.search", parameters: params, success: { response in
            guard let results = response.results else {
                error?(LFMError(error: -1, message: "Error: track.search."))
                return
            }
            success(results)
        }, error: error)
    }
    
    /// Used to notify Last.fm that a user has started listening to a track. Parameter names are case sensitive.
    /// - Parameters:
    ///   - artist: The artist name.
    ///   - track: The track name.
    ///   - album: The album name.
    ///   - success: Success function
    ///   - error: (Optional) Error function (LFMError) -> Void
    public func updateNowPlaying(artist: String, track: String, album: String, success: @escaping () -> Void, error: ((LFMError) -> Void)? = nil){
        handler.request(method: "track.updatenowplaying", parameters: ["artist": artist, "track": track, "album": album, "sk": session.key], success: { _ in
            success()
        }, error: error, requiresSignature: true, type: .post)
    }
    
    /// Used to notify Last.fm that a user has started listening to a track. Parameter names are case sensitive.
    /// - Parameters:
    ///   - mbid: The MusicBrainz Track ID.
    ///   - success: Success function
    ///   - error: (Optional) Error function (LFMError) -> Void
    public func updateNowPlaying(mbid: String, success: @escaping () -> Void, error: ((LFMError) -> Void)? = nil){
        handler.request(method: "track.updatenowplaying", parameters: ["mbid": mbid, "sk": session.key], success: { _ in
            success()
        }, error: error, requiresSignature: true, type: .post)
    }
    
    /// Used to add a track-play to a user's profile, scrobble a track.
    /// - Parameters:
    ///   - artist: The artist name.
    ///   - track: The track name.
    ///   - timestamp: The time the track started playing, in UNIX timestamp format (integer number of seconds since 00:00:00, January 1st 1970 UTC). This must be in the UTC time zone.
    ///   - album: The album name.
    ///   - album_artist: The album artist - if this differs from the track artist.
    ///   - success: Success function
    ///   - error: (Optional) Error function (LFMError) -> Void
    public func scrobble(artist: String, track: String, timestamp: Int, album: String, album_artist: String? = nil, success: @escaping () -> Void, error: ((LFMError) -> Void)? = nil){
        handler.request(method: "track.scrobble", parameters: ["artist": artist, "track": track, "timestamp": timestamp, "album": album, "albumArtist": album_artist ?? artist, "sk": session.key], success: { response in
            success()
        }, error: error, requiresSignature: true, type: .post)
    }
    
    /// Used to add a track-play to a user's profile, scrobble a track.
    /// - Parameters:
    ///   - mbid: The MusicBrainz Track ID.
    ///   - success: Success function
    ///   - error: (Optional) Error function (LFMError) -> Void
    public func scrobble(mbid: String, success: @escaping () -> Void, error: ((LFMError) -> Void)? = nil){
        handler.request(method: "track.scrobble", parameters: ["mbid": mbid, "sk": session.key], success: { response in
            success()
        }, error: error, requiresSignature: true, type: .post)
    }
    
}
