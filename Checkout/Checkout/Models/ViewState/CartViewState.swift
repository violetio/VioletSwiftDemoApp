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
    @Published var currentOrder: Order? = nil
    
    var noCart: Bool { cartId == nil }
    
    var cartEmpty: Bool { skuCount == 0 }
    
    var bagViewStatesArray: [BagViewState] { return Array(bagViewStates.values) }
    
    var bagCount: Int { bagViewStates.count }
    
    init(skuCount: Int = 0) {
        self.skuCount = skuCount
    }
    
    convenience init(order: Order) {
        self.init()
        self.updateWithNewOrder(order: order)
    }
    
    func updateWithNewOrder(order: Order) {
        Logger.debug("CartViewState - Update")
        self.currentOrder = order
        if let orderId = order.id {
            self.cartId = orderId
            let currentBagIdSet = Set(bagViewStates.keys)
            var updateBagIdSet = Set<Int64>()
            Logger.debug("CartViewState - - Order ID: \(orderId)")
            
            self.cartSubTotalText = (Double(order.subTotal ?? 0) / 100).formatted(.currency(code: "USD"))
            
            var calcSkuCount: Int = 0
            order.bags?.forEach({ bag in
                Logger.debug("CartViewState - - - Bag ID: \(bag.id ?? 0)")
                if let bagID = bag.id {
                    updateBagIdSet.insert(bagID)
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
//            Logger.debug("CartViewState - - currentBagIdSet: \(currentBagIdSet)")
//            Logger.debug("CartViewState - - updateBagIdSet: \(updateBagIdSet)")
            let removedBagIdSet = currentBagIdSet.subtracting(updateBagIdSet)
//            Logger.debug("CartViewState - - removedBagIdSet: \(removedBagIdSet)")
            for removedBagId in removedBagIdSet {
                bagViewStates.removeValue(forKey: removedBagId)
            }
            
            self.skuCount = calcSkuCount
            Logger.debug("CartViewState - - skuCount: \(skuCount)")
        }
    }
}

class BagViewState: ObservableObject, Identifiable {
    @Published var orderID: OrderID = 0
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
        self.orderID = bag.orderId ?? 0
        self.bagMerchantName = bag.merchantName ?? ""
        self.bagSubtotalText = (Double(bag.subTotal ?? 0) / 100).formatted(.currency(code: "USD"))
        var collectOrderSkuViewStates: [OrderSkuID: OrderSkuViewState] = [:]
        bag.skus?.forEach({ orderSku in
            if let orderSkuID = orderSku.id {
                let nextOrderSkuViewState = OrderSkuViewState(orderID: self.orderID, orderSku: orderSku)
                collectOrderSkuViewStates[orderSkuID] = nextOrderSkuViewState
            }
        })
        self.orderSkuViewStates = collectOrderSkuViewStates
    }
    
}

class OrderSkuViewState: ObservableObject, Identifiable {
    @Published var orderID: OrderID = 0
    @Published var orderSkuID: OrderSkuID = 0
    @Published var quantity: Int = 0
    @Published var thumbURL: URL? = nil
    @Published var name: String = ""
    @Published var brand: String = ""
    @Published var skuPriceText: String = ""
    
    init(orderID: OrderID, orderSku: OrderSku? = nil) {
        self.orderID = orderID
        if let initOrderSku = orderSku {
            self.update(orderSku: initOrderSku)
        }
        
    }

    
    func update(orderSku: OrderSku) {
        self.orderSkuID = orderSku.id ?? 0
        self.quantity = orderSku.quantity ?? 0
        
        self.skuPriceText = (Double(orderSku.price ?? 0) / 100).formatted(.currency(code: "USD"))
        
        self.name = orderSku.name ?? ""
        self.brand = orderSku.brand ?? ""
        if let urlString = orderSku.thumbnail {
            thumbURL = URL(string: urlString)
        }
    }
    
    
    
}
