//
//  LFMKitAPI.swift
//  LFMKit
//
//  Created by @verizxn on 26/05/24.
//

public struct LFMKitAPI {
    private let ENDPOINT = "https://ws.audioscrobbler.com/2.0/"
    
    public let handler: LFMKitRequests!
    public var session: LFMResponseSession!
    
    public var user: LFMUser!
    public var track: LFMTrack!
    public var auth: LFMAuth!
    
    public init(api_key: String, api_secret: String){
        self.handler = LFMKitRequests(api_key: api_key, api_secret: api_secret)
        
        self.user = LFMUser(handler: handler)
        self.track = LFMTrack(handler: handler)
        self.auth = LFMAuth(handler: handler)
    }
    
    public mutating func setSession(session: LFMResponseSession){
        self.session = session
        user.session = session
        track.session = session
        auth.session = session
    }
}
