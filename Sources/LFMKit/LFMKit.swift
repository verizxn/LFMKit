//
//  LFMKit.swift
//  LFMKit
//
//  Created by verizxn on 26/05/24.
//

public class LFMKit {
    internal var _session: LFMSession?
    public var session: LFMSession? {
        get {
            _session
        }
        set {
            if let newSession = newValue {
                self.setSession(session: newSession)
            }
        }
    }
    
    public let user: LFMUser
    public var track: LFMTrack
    public var auth: LFMAuth
    
    /// Initialize the class.
    /// - Parameters:
    ///   - api_key: A Last.fm API key.
    ///   - api_secret: A Last.fm API secret.
    public init(api_key: String, api_secret: String){
        let keys = LFMKeys(api_key: api_key, api_secret: api_secret)
        self.user = LFMUser(keys: keys)
        self.track = LFMTrack(keys: keys)
        self.auth = LFMAuth(keys: keys)
    }
    
    /// Sets the session.
    /// - Parameter session: LFMResponseSession(name: String, key: String, subscriber: Int)
    public func setSession(session: LFMSession){
        self._session = session
        user.session = session
        track.session = session
        auth.session = session
    }
}
