//
//  LFMKit.swift
//  LFMKit
//
//  Created by verizxn on 26/05/24.
//

public class LFMKit {
    public let handler: LFMKitRequests
    public var session: LFMSession?
    
    public let user: LFMUser
    public var track: LFMTrack
    public var auth: LFMAuth
    
    /// Initialize the class.
    /// - Parameters:
    ///   - api_key: A Last.fm API key.
    ///   - api_secret: A Last.fm API secret.
    public init(api_key: String, api_secret: String){
        self.handler = LFMKitRequests(api_key: api_key, api_secret: api_secret)
        
        self.user = LFMUser(handler: handler)
        self.track = LFMTrack(handler: handler)
        self.auth = LFMAuth(handler: handler)
    }
    
    /// Sets the session.
    /// - Parameter session: LFMResponseSession(name: String, key: String, subscriber: Int)
    public func setSession(session: LFMSession){
        self.session = session
        user.session = session
        track.session = session
        auth.session = session
    }
}
