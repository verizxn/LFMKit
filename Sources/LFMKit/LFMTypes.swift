//
//  LFMTypes.swift
//  LFMKit
//
//  Created by verizxn on 26/05/24.
//

public struct LFMKeys {
    public let api_key: String
    public let api_secret: String
}

public struct LFMResponse: Codable {
    public let error: Int?
    public let message: String?
    
    public let user: LFMResponseUser?
    public let recenttracks: LFMResponseTracks?
    public let friends: LFMResponseFriends?
    public let track: LFMResponseTrackFull?
    public let results: LFMResponseTrackResults?
    public let session: LFMSession?
}

public struct LFMResponseImage: Codable {
    public let size: String
    public let text: String
    
    enum CodingKeys: String, CodingKey {
        case size
        case text = "#text"
    }
}

public struct LFMResponseMB: Codable {
    public let mbid: String?
    public let text: String?
    public let name: String?
    public let url: String?
    
    enum CodingKeys: String, CodingKey {
        case mbid
        case name
        case url
        case text = "#text"
    }
}

public struct LFMResponseDate: Codable {
    public let uts: String
    public let text: String
    
    enum CodingKeys: String, CodingKey {
        case uts
        case text = "#text"
    }
}

public struct LFMResponseAlbum: Codable {
    public let artist: String
    public let title: String
    public let url: String
    public let image: [LFMResponseImage]
}

public struct LFMResponseTracks: Codable {
    public let track: [LFMResponseTrack]
}

public struct LFMResponseTrackResults: Codable {
    public let totalResults: String
    public let startIndex: String
    public let itemsPerPage: String
    public let trackmatches: LFMResponseTrackMatches
    
    enum CodingKeys: String, CodingKey {
        case totalResults = "opensearch:totalResults"
        case startIndex = "opensearch:startIndex"
        case itemsPerPage = "opensearch:itemsPerPage"
        case trackmatches
    }
}

public struct LFMResponseTrackMatches: Codable {
    public let track: [LFMResponseTrackMatch]
}

public struct LFMResponseFriends: Codable {
    public let user: [LFMResponseUser]
}

public struct LFMResponseUser: Codable {
    public let name: String
    public let subscriber: String
    public let realname: String
    public let playcount: String
    public let artist_count: String?
    public let playlists: String?
    public let track_count: String?
    public let album_count: String?
    public let image: [LFMResponseImage]
//    public let registered: [String: String]
    public let country: String
    public let gender: String?
    public let url: String
    public let type: String
}

public struct LFMResponseTrack: Codable {
    public let artist: LFMResponseMB
    public let streamable: String
    public let image: [LFMResponseImage]
    public let mbid: String
    public let album: LFMResponseMB?
    public let name: String
    public let url: String
    public let date: LFMResponseDate?
}

public struct LFMResponseTrackMatch: Codable {
    public let name: String
    public let artist: String
    public let url: String
    public let streamable: String
    public let listeners: String
    public let image: [LFMResponseImage]
    public let mbid: String
}

public struct LFMResponseTrackFull: Codable {
    public let name: String
    public let url: String
    public let duration: String
    public let listeners: String
    public let playcount: String
    public let artist: LFMResponseMB
    public let album: LFMResponseAlbum?
    public let userplaycount: String?
    public let userloved: String?
}

public struct LFMSession: Codable {
    public let name: String
    public let key: String
    public let subscriber: Int
    
    public init(name: String, key: String, subscriber: Int) {
        self.name = name
        self.key = key
        self.subscriber = subscriber
    }
}

public struct LFMError: Codable {
    public let error: Int
    public let message: String
    
    public init(error: Int, message: String){
        self.error = error
        self.message = message
    }
}
