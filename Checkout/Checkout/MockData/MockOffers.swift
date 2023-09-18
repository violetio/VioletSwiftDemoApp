//
//  MockOffers.swift
//  Checkout
//
//  Created on 3/16/23.
//

import Foundation
import Violet


public class MockOffers {

    public static func load_Offer_12555() -> Offer? {
        return decode(from: jsonData(forResource: "Offer_ID_12555_response"))
    }

    public static func load_Offer_12574() -> Offer? {
        return decode(from: jsonData(forResource: "Offer_ID_12574_Response"))
    }
    
    public static func load_PageOffers() -> PageOffer? {
        return decode(from: jsonData(forResource: "PageOffer_Page_1_MerchantID_10003_Response"))
    }
    
    public static func load_PageOffers_NoMerchantID() -> PageOffer? {
        return decode(from: jsonData(forResource: "PageOffer_Page_1_No_MerchantID_Response"))
    }
    
    public static func load_PageOffers(offerId: Int64) -> Offer? {
        guard let pageOffers = load_PageOffers() else { return nil }
        guard let offersArray = pageOffers.content else { return nil }
        return offersArray.first(where: {$0.id == offerId})
    }
    
    public static func load_PageOffers_NoMerchantID(offerId: Int64) -> Offer? {
        guard let pageOffers = load_PageOffers_NoMerchantID() else { return nil }
        guard let offersArray = pageOffers.content else { return nil }
        return offersArray.first(where: {$0.id == offerId})
    }
    
    public static func load_OrderID_71169() -> Order? {
        guard let jsonData = jsonData(forResource: "Order_ID_71169_GetCartByID_Response") else {
            return nil
        }
        return decode(from: jsonData)
    }
    
    public static func load_OrderID_74599() -> Order? {
        guard let jsonData = jsonData(forResource: "Order_ID_74599_GetCartByID_Response") else {
            return nil
        }
        return decode(from: jsonData)
    }
    
    public static func load_OrderID_74445() -> Order? {
        guard let jsonData = jsonData(forResource: "Order_ID_74445_GetCartByID_Response") else {
            return nil
        }
        return decode(from: jsonData)
    }
    
    public static func load_OrderID_73936() -> Order? {
        guard let jsonData = jsonData(forResource: "Order_ID_73936_GetCartByID_Response") else {
            return nil
        }
        return decode(from: jsonData)
    }
    
    public static func load_OrderID_73938() -> Order? {
        guard let jsonData = jsonData(forResource: "Order_ID_73938_GetCartByID_Response") else {
            return nil
        }
        return decode(from: jsonData)
    }
    
    public static func load_OrderID_74688() -> Order? {
        guard let jsonData = jsonData(forResource: "Order_ID_74688_GetCartByID_Response") else {
            return nil
        }
        return decode(from: jsonData)
    }
    
    public static func load_OrderID_73936_ShippingMethods() -> OrderShippingMethodWrapperArray? {
        guard let jsonData = jsonData(forResource: "Order_ID_73936_ShippingAvailable_Response") else {
            return nil
        }
        return decode(from: jsonData)
    }
    
    static func jsonData(_ url: URL? = nil) -> Data? {
        guard let fileURL = url else {
            return nil
        }
        return try? Data(contentsOf: fileURL)
    }
    
    static func jsonData(forResource name: String) -> Data? {
        guard let fileURL = Bundle.main.url(forResource: name, withExtension: "json") else {
            return nil
        }
        return try? Data(contentsOf: fileURL)
    }
    
    public static func decode<T: Decodable>(from data: Data? = nil) -> T? {
        guard let jsonData = data else { return nil }
        let decodeResult = CodableHelper.decode(T.self, from: jsonData)
        var result: T? = nil
        switch decodeResult {
        case .failure:
            result = nil
        case .success(let decodedOrder):
            result = decodedOrder
        }
        return result
    }

}
