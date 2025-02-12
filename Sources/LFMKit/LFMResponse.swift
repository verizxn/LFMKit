//
//  LFMResponse.swift
//  LFMKit
//
//  Created by verizxn on 26/05/24.
//

public struct LFMResponse: Decodable {
    public let error: Int?
    public let message: String?
    
    public let user: LFMResponseUser?
    public let recenttracks: LFMResponseTracks?
    public let friends: LFMResponseFriends?
    public let track: LFMResponseTrackFull?
    public let results: LFMResponseTrackResults?
    public let session: LFMSession?
}

public struct LFMResponseImage: Decodable {
    public let size: String
    public let text: String
    
    enum CodingKeys: String, CodingKey {
        case size
        case text = "#text"
    }
}

public struct LFMResponseMB: Decodable {
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

public struct LFMResponseDate: Decodable {
    public let uts: String
    public let text: String
    
    enum CodingKeys: String, CodingKey {
        case uts
        case text = "#text"
    }
}

public struct LFMResponseAlbum: Decodable {
    public let artist: String
    public let title: String
    public let url: String
    public let image: [LFMResponseImage]
}

public struct LFMResponseTracks: Decodable {
    public let track: [LFMResponseTrack]
}

public struct LFMResponseTrackResults: Decodable {
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

public struct LFMResponseTrackMatches: Decodable {
    public let track: [LFMResponseTrackMatch]
}

public struct LFMResponseFriends: Decodable {
    public let user: [LFMResponseUser]
}

public struct LFMResponseUser: Decodable {
    public let name: String
    public let subscriber: String
    public let realname: String
    public let playcount: String
    public let artist_count: String?
    public let playlists: String?
    public let track_count: String?
    public let album_count: String?
    public let image: [LFMResponseImage]
    //public let registered: [String: String]
    public let country: String
    public let gender: String?
    public let url: String
    public let type: String
}

public struct LFMResponseTrack: Decodable {
    public let artist: LFMResponseMB
    public let streamable: String
    public let image: [LFMResponseImage]
    public let mbid: String
    public let album: LFMResponseMB?
    public let name: String
    public let url: String
    public let date: LFMResponseDate?
}

public struct LFMResponseTrackMatch: Decodable {
    public let name: String
    public let artist: String
    public let url: String
    public let streamable: String
    public let listeners: String
    public let image: [LFMResponseImage]
    public let mbid: String
}

public struct LFMResponseTrackFull: Decodable {
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

public struct LFMSession: Decodable {
    public let name: String
    public let key: String
    public let subscriber: Int
    
    public init(name: String, key: String, subscriber: Int) {
        self.name = name
        self.key = key
        self.subscriber = subscriber
    }
}

public struct LFMError {
    public let error: Int
    public let message: String

    public init(error: Int, message: String){
        self.error = error
        self.message = message
    }

}
