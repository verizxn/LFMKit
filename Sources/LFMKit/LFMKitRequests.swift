//
//  LFMKitRequests.swift
//  LFMKit
//
//  Created by @verizxn on 26/05/24.
//

import Foundation
import SwiftMD5
import Alamofire

public struct LFMKitRequests {
    public let api_key: String!
    public let api_secret: String!
    public var session_key: String!
    
    public let ENDPOINT = "https://ws.audioscrobbler.com/2.0/"
    
    public init(api_key: String!, api_secret: String!) {
        self.api_key = api_key
        self.api_secret = api_secret
    }
    
    public func request(method: String, parameters: Parameters, success: @escaping (LFMResponse) -> Void, error: ((LFMError) -> Void)? = nil, requiresSignature: Bool = false, type: HTTPMethod = .get){
        var params = parameters
        params["format"] = "json"
        params["method"] = method
        params["api_key"] = api_key
        if requiresSignature {params["api_sig"] = generateSignature(params: params)}
        
        AF.request(ENDPOINT, method: type, parameters: params).response {response in
            guard let data = response.data else { return }
            
            do {
                let response = try JSONDecoder().decode(LFMResponse.self, from: data)
                if let error_num = response.error, let error_message = response.message {
                    if let e = error {
                        e(LFMError(error: error_num, message: error_message))
                    }
                    return
                }
                success(response)
            } catch {
                print(error)
            }
        }
    }
    
    public func generateSignature(params: Parameters) -> String {
        var keys = params
        keys["format"] = nil
        let sorted = keys.sorted(by: { $0.0 < $1.0 })
        var signature = (sorted.compactMap({ (key, value) -> String in
            return "\(key)\(value)"
        }) as Array).joined()
        signature += api_secret!
        return signature.md5()
    }
}
