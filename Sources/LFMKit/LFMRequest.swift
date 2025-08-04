//
//  LFMRequest.swift
//  LFMKit
//
//  Created by verizxn on 26/05/24.
//

import Foundation

import Alamofire
import SwiftHash

public class LFMRequest {
    internal let keys: LFMKeys
    public var session: LFMSession!
    
    private let endpoint = "https://ws.audioscrobbler.com/2.0/"
    
    public init(keys: LFMKeys) {
        self.keys = keys
    }
    
    public func request(method: String, parameters: Parameters, success: @escaping (LFMResponse) -> Void, error: ((LFMError) -> Void)? = nil, requiresSignature: Bool = false, type: HTTPMethod = .get){
        var params = parameters
        params["format"] = "json"
        params["method"] = method
        params["api_key"] = keys.api_key
        if requiresSignature {
            params["api_sig"] = generateSignature(params: params)
        }
        
        AF.request(endpoint, method: type, parameters: params).response { response in
            if let e = response.error {
                error?(LFMError(error: -1, message: e.errorDescription ?? "Could not perform the request."))
                return
            }
            guard let data = response.data else {
                error?(LFMError(error: -1, message: "Could not retrieve data."))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(LFMResponse.self, from: data)
                if let error_num = response.error,
                   let error_message = response.message {
                    error?(LFMError(error: error_num, message: error_message))
                    return
                }
                success(response)
            } catch let e {
                error?(LFMError(error: -1, message: e.localizedDescription))
            }
        }
    }
    
    internal func generateSignature(params: Parameters) -> String {
        var keys = params
        keys["format"] = nil
        
        let sorted = keys.sorted(by: { $0.0 < $1.0 })
        let signature = sorted.compactMap { "\($0)\($1)" }.joined() + self.keys.api_secret
        
        return MD5(signature)
    }
}
