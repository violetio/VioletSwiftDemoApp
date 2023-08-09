//
//  Offer+Extensions.swift
//  Checkout
//
//  Created by Alan Morford on 4/18/23.
//

import Violet
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
    
    func allAlbumMediaURLs() -> [URL] {
        guard let albumSet = self.albums else {
            return []
        }
        let urlsOut: [URL] = albumSet.reduce(into: [URL](), { partialResult, nextAlbum in
            let urlString = nextAlbum.media?.compactMap {  $0.url } ?? []
            let urls = urlString.compactMap {  URL(string: $0)}
            partialResult.append(contentsOf: urls)
        })
        return urlsOut
    }
}

extension Sku: Identifiable {
    //No override needed because an `id` already exists on Sku
}
