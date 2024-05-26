//
//  LFMAuth.swift
//  LFMKit
//
//  Created by @verizxn on 26/05/24.
//

import Foundation

public struct LFMAuth: LFMClass {
    public var handler: LFMKitRequests!
    public var session: LFMResponseSession!
    
    public init(handler: LFMKitRequests) {
        self.handler = handler
    }
    
    public func getLogin(callback: String) -> URL {
        return URL(string: "https://www.last.fm/api/auth?api_key=\(self.handler.api_key!)&cb=\(callback.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)")!
    }
    
    public func getSession(token: String, success: @escaping (LFMResponseSession) -> Void, error: @escaping (Int, String) -> Void){
        handler.request(method: "auth.getsession", parameters: ["token": token], success: { response in
            if let session = response.session {
                success(session)
            }
        }, error: { n, d in
            error(n, d)
        }, requiresSignature: true)
    }
    
}
