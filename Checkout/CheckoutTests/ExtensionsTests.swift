//
//  ExtensionsTests.swift
//  CheckoutTests
//
//  Created on 4/18/23.
//

import XCTest
@testable import Checkout
import Violet

final class ExtensionsTests: XCTestCase {


    func test_firstAlbumMediaImageURL() throws {
        guard let offer = MockOffers.load_Offer_12555() else {
            XCTFail("Missing offer to test")
            return
        }
        
        XCTAssertNotNil(offer.firstAlbum())
        XCTAssertNotNil(offer.firstAlbumMedia())
        XCTAssertNotNil(offer.firstAlbumMediaImageSourceUrl())
        XCTAssertNotNil(offer.firstAlbumMediaImageURL())
    }

    func test_allAlbumMediaURLs() throws {
        guard let offer = MockOffers.load_Offer_12574() else {
            XCTFail("Missing offer to test")
            return
        }
        
        guard let albumSet = offer.albums else {
            return
        }
        let urlsOut: [URL] = albumSet.reduce(into: [URL](), { partialResult, nextAlbum in
            let urlString = nextAlbum.media?.compactMap {  $0.url } ?? []
            let urls = urlString.compactMap {  URL(string: $0)}
            partialResult.append(contentsOf: urls)
        })
        
        Logger.info("urlsOut: \(urlsOut)")
    }
}
