//
//  MockOffers.swift
//  Checkout
//
//  Created by Alan Morford on 3/16/23.
//

import Foundation
import Violet


public class MockOffers {

    public static func load_Offer_12555() -> Offer? {
        guard let jsonData = jsonData(forResource: "Offer_ID_12555_response") else {
            return nil
        }
        return decodeOffer(from: jsonData)
    }

    public static func load_Offer_12574() -> Offer? {
        guard let jsonData = jsonData(forResource: "Offer_ID_12574_Response") else {
            return nil
        }
        return decodeOffer(from: jsonData)
    }
    
    public static func load_PageOffers() -> PageOffer? {
        guard let jsonData = jsonData(forResource: "PageOffer_Page_1_MerchantID_10003_Response") else {
            return nil
        }
        return decodePageOffer(from: jsonData)
    }
    
    public static func load_OrderID_71169() -> Order? {
        guard let jsonData = jsonData(forResource: "Order_ID_71169_GetCartByID_Response") else {
            return nil
        }
        return decodeOrder(from: jsonData)
    }

    static func jsonData(forResource name: String) -> Data? {
        guard let fileURL = Bundle.main.url(forResource: name, withExtension: "json") else {
            return nil
        }
        return try? Data(contentsOf: fileURL)
    }

    static func decodeOrder(from jsonData: Data) -> Order? {
        let decodeResult = CodableHelper.decode(Order.self, from: jsonData)
        var pageOffer: Order? = nil
        switch decodeResult {
        case .failure:
            pageOffer = nil
        case .success(let decodedOrder):
            pageOffer = decodedOrder
        }
        return pageOffer

    }
    
    static func decodePageOffer(from jsonData: Data) -> PageOffer? {
        let decodeResult = CodableHelper.decode(PageOffer.self, from: jsonData)
        var pageOffer: PageOffer? = nil
        switch decodeResult {
        case .failure:
            pageOffer = nil
        case .success(let decodedPageOffer):
            pageOffer = decodedPageOffer
        }
        return pageOffer

    }
    
    static func decodeOffer(from jsonData: Data) -> Offer? {
        let decodeResult = CodableHelper.decode(Offer.self, from: jsonData)
        var offer: Offer? = nil
        switch decodeResult {
        case .failure:
            offer = nil
        case .success(let decodedOffer):
            offer = decodedOffer
        }
        return offer

    }

    /// Generated from ChatGPT! 👍
    public static func indexDictionary(from strings: [String]) -> [String: Int] {
        return strings.enumerated().reduce(into: [:]) { result, tuple in
            let (index, string) = tuple
            result[string] = index
        }
    }




}
