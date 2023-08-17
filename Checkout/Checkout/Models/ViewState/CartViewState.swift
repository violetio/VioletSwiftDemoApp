//
//  CartViewState.swift
//  Checkout
//
//  Created on 5/6/23
//

import Foundation
import Violet

class CartViewState: ObservableObject {
    @Published var cartId: Int64? = nil
    @Published var skuCount: Int = 0
    @Published var cartSubTotalText: String = ""
    @Published var bagViewStates: [Int64: BagViewState] = [:]
    
    var noCart: Bool { cartId == nil }
    
    var cartEmpty: Bool { skuCount == 0 }
    
    var bagViewStatesArray: [BagViewState] { return Array(bagViewStates.values) }
    
    init(skuCount: Int = 0) {
        self.skuCount = skuCount
    }
    
    convenience init(order: Order) {
        self.init()
        self.updateWithNewOrder(order: order)
    }
    
    func updateWithNewOrder(order: Order) {
        Logger.debug("CartViewState - Update")
        if let orderId = order.id {
            self.cartId = orderId
            Logger.debug("CartViewState - - Order ID: \(orderId)")
            
            self.cartSubTotalText = (Double(order.subTotal ?? 0) / 100).formatted(.currency(code: "USD"))
            
            var calcSkuCount: Int = 0
            order.bags?.forEach({ bag in
                Logger.debug("CartViewState - - - Bag ID: \(bag.id ?? 0)")
                if let bagID = bag.id {
                    bag.skus?.forEach({ orderSku in
                        if let orderSkuID = orderSku.id {
                            Logger.debug("CartViewState - - - OrderSku ID: \(orderSkuID)")
                            calcSkuCount += orderSku.quantity ?? 0
                            Logger.debug("CartViewState - - - calcSkuCount: \(calcSkuCount)")
                        }
                    })
                    bagViewStates[bagID] = BagViewState(bagID: bagID, bag: bag)
                }
            })
            
            self.skuCount = calcSkuCount
            Logger.debug("CartViewState - - skuCount: \(skuCount)")
        }
    }
}

class BagViewState: ObservableObject, Identifiable {
    @Published var bagID: Int64 = 0
    @Published var orderSkuViewStates: [OrderSkuID: OrderSkuViewState]
    @Published var bagSubtotalText: String = ""
    @Published var bagMerchantName: String = ""
    
    
    var orderSkuViewStatesArray: [OrderSkuViewState] { return Array(orderSkuViewStates.values) }
    
    var id: Int64 { bagID }
    
    init(bagID: Int64 = 0, orderSkuViewStates: [OrderSkuID: OrderSkuViewState] = [:], bag: Bag? = nil) {
        self.bagID = bagID
        self.orderSkuViewStates = orderSkuViewStates
        if let initBag = bag {
            update(bag: initBag)
        }
        Logger.debug("BagViewState - Init - bagID: \(bagID) - orderSkuIDCount - \(orderSkuViewStates)")
    }
    
    func update(bag: Bag) {
        self.bagID = bag.id ?? 0
        self.bagMerchantName = bag.merchantName ?? ""
        self.bagSubtotalText = (Double(bag.subTotal ?? 0) / 100).formatted(.currency(code: "USD"))
        var collectOrderSkuViewStates: [OrderSkuID: OrderSkuViewState] = [:]
        bag.skus?.forEach({ orderSku in
            if let orderSkuID = orderSku.id {
                let nextOrderSkuViewState = OrderSkuViewState(orderSku: orderSku)
                collectOrderSkuViewStates[orderSkuID] = nextOrderSkuViewState
            }
        })
        self.orderSkuViewStates = collectOrderSkuViewStates
    }
    
}

class OrderSkuViewState: ObservableObject, Identifiable {
    @Published var orderSkuID: OrderSkuID = 0
    @Published var quantity: Int = 0
    @Published var thumbURL: URL? = nil
    
    init(orderSkuID: OrderSkuID = 0, skuCount: Int = 0, orderSku: OrderSku? = nil) {
        self.orderSkuID = orderSkuID
        self.quantity = skuCount
        if let initOrderSku = orderSku {
            self.update(orderSku: initOrderSku)
        }
        
    }

    
    func update(orderSku: OrderSku) {
        self.orderSkuID = orderSku.id ?? 0
        self.quantity = orderSku.quantity ?? 0
        if let urlString = orderSku.thumbnail {
            thumbURL = URL(string: urlString)
        }
    }
    
    
    
}
