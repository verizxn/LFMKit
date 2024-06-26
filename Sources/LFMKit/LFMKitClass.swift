//
//  LFMClass.swift
//  LFMKit
//
//  Created by @verizxn on 26/05/24.
//

public protocol LFMClass {
    var handler: LFMKitRequests! { get set }
    var session: LFMResponseSession! { get set }
    
    init(handler: LFMKitRequests)
}
