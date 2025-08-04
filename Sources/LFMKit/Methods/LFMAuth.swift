//
//  LFMAuth.swift
//  LFMKit
//
//  Created by verizxn on 26/05/24.
//

import Foundation

public class LFMAuth: LFMRequest {
    /// Get login url to authenticate the user.
    /// - Parameter callback: Your application callback.
    /// - Returns: Returns URL.
    public func getLoginURL(callback: String) -> URL {
        return URL(string: "https://www.last.fm/api/auth?api_key=\(keys.api_key)&cb=\(callback.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)")!
    }
    
    /// Fetch a session key for a user. The third step in the authentication process.
    /// - Parameters:
    ///   - token: A 32-character ASCII hexadecimal MD5 hash returned by step 1 of the authentication process (following the granting of permissions to the application by the user).
    ///   - success: Success function (LFMSession) -> Void
    ///   - error: (Optional) Error function (LFMError) -> Void
    public func getSession(token: String, success: @escaping (LFMSession) -> Void, error: ((LFMError) -> Void)? = nil){
        self.request(method: "auth.getsession", parameters: ["token": token], success: { response in
            guard let session = response.session else {
                error?(LFMError(error: -1, message: "Error: auth.getsession."))
                return
            }
            success(session)
        }, error: error, requiresSignature: true)
    }
    
}
