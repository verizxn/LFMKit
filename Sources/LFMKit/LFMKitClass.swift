//
//  LFMClass.swift
//  LFMKit
//
//  Created by verizxn on 26/05/24.
//

public protocol LFMClass {
    var handler: LFMKitRequests { get }
    var session: LFMSession! { get set }
    
    init(handler: LFMKitRequests)
}
