//
//  Offer+Extensions.swift
//  Checkout
//
//  Created by Alan Morford on 4/18/23.
//

import VioletPublicClientAPI
import Foundation

public extension Offer {
    func firstAlbumMediaImageURL() -> URL? {
        guard let urlString: String = firstAlbumMediaImageSourceUrl() else {
            return nil
        }
        return URL(string: urlString)
    }
    
    func firstAlbumMediaImageSourceUrl() -> String? {
        return self.firstAlbumMedia()?.sourceUrl
    }
    
    func firstAlbumMedia() -> Media? {
        
        return self.firstAlbum()?.media?.first
    }
    
    func firstAlbum() -> Album? {
        return self.albums?.first
    }
}
