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
    @Published var cartCurrency: String = "USD"
    @Published var skuCount: Int = 0
    @Published var cartSubTotalText: String = ""
    @Published var cartShippingTotalText: String = ""
    @Published var cartTaxText: String = ""
    @Published var cartFullTotalText: String = ""
    @Published var bagViewStates: [Int64: BagViewState] = [:]
    @Published var currentOrder: Order? = nil
    @Published var shippingViewState: ShippingViewState = ShippingViewState()
    @Published var currentOrderShippingMethods: OrderShippingMethodWrapperArray? = nil
    @Published var checkoutPagesComplete: Set<NavigationKey> = Set()
    @Published var orderShippingMethodSelectViewState: OrderShippingMethodSelectViewState? = nil
    @Published var payment_intent_client_secret: String? = nil
    @Published var paymentSheetViewState: PaymentSheetViewState = PaymentSheetViewState()
    
    var noCart: Bool { cartId == nil }
    
    var cartEmpty: Bool { skuCount == 0 }
    
    @Published var cartNotEmpty: Bool = true
    
    var bagViewStatesArray: [BagViewState] { return Array(bagViewStates.values.sorted(by: { $0.bagID < $1.bagID })) }
    
    var bagCount: Int { bagViewStates.count }
    
    
    init(order: Order? = nil, orderShippingMethods: OrderShippingMethodWrapperArray? = nil) {
        if let foundOrder = order {
            self.updateWithNewOrder(order: foundOrder)
        }
        if let foundOrderShippingMethods = orderShippingMethods {
            self.updateWithNewShippingMethods(orderShippingMethods: foundOrderShippingMethods)
        }
    }
    
    func updateWithNewShippingMethods(orderShippingMethods: OrderShippingMethodWrapperArray) {
        self.currentOrderShippingMethods = orderShippingMethods
        self.orderShippingMethodSelectViewState = OrderShippingMethodSelectViewState(orderShippingMethods: orderShippingMethods, order: self.currentOrder)
    }
    
    func logOrderTotals() {
        Logger.debug("Subtotal: \(cartSubTotalText) - Shipping: \(cartShippingTotalText) - Tax: \(cartTaxText) - FullTotal: \(cartFullTotalText)")
    }
    func updateWithNewOrder(order: Order) {
        Logger.debug("CartViewState - Update")
        self.currentOrder = order
        if let orderId = order.id {
            self.cartId = orderId
            Logger.debug("orderId: \(orderId)")
            let currentBagIdSet = Set(bagViewStates.keys)
            var updateBagIdSet = Set<Int64>()
            self.cartCurrency = order.cartCurrency
            
            self.cartSubTotalText = order.cartSubTotalText
            self.cartTaxText = order.cartTaxTotalText
            self.cartShippingTotalText = order.cartShippingTotalText
            self.cartFullTotalText = order.cartFullTotalText
//            logOrderTotals()
            
            var calcSkuCount: Int = 0
            order.bags?.forEach({ bag in
                //Logger.debug("CartViewState - - - Bag ID: \(bag.id ?? 0)")
                if let bagID = bag.id {
                    updateBagIdSet.insert(bagID)
                    bag.skus?.forEach({ orderSku in
                        if orderSku.id != nil {
                            calcSkuCount += orderSku.quantity ?? 0
                        }
                    })
                    bagViewStates[bagID] = BagViewState(bagID: bagID, bag: bag)
                }
            })

            let removedBagIdSet = currentBagIdSet.subtracting(updateBagIdSet)
            for removedBagId in removedBagIdSet {
                bagViewStates.removeValue(forKey: removedBagId)
            }
            
            self.skuCount = calcSkuCount
            self.cartNotEmpty = calcSkuCount > 0
            
            if let foundPaymentIntent = order.paymentIntentClientSecret {
                self.paymentSheetViewState.update(payment_intent_client_secret: foundPaymentIntent, bagCount: self.bagCount)
            }

        }
        
        shippingViewState.loadFrom(customer: order.customer,
                                        shippingAddress: order.shippingAddress,
                                        billingAddress: order.billingAddress)
    }
    
    func orderSkuViewState(offerSkuId: OfferSkuID) -> OrderSkuViewState? {
        for next in bagViewStatesArray {
            if let found = next.orderSkuViewState(offerSkuId: offerSkuId) {
                return found
            }
        }
        return nil
    }
    
    func restart() {
        self.cartId = nil
        self.skuCount = 0
        self.cartSubTotalText = ""
        self.cartShippingTotalText = ""
        self.cartTaxText = ""
        self.cartFullTotalText = ""
        self.bagViewStates = [:]
        self.currentOrder = nil
        self.shippingViewState = ShippingViewState()
        self.currentOrderShippingMethods = nil
        self.checkoutPagesComplete = Set()
        self.orderShippingMethodSelectViewState = nil
        self.payment_intent_client_secret = nil
        self.paymentSheetViewState = PaymentSheetViewState()
        
    }
}

class BagViewState: ObservableObject, Identifiable {
    @Published var orderID: OrderID = 0
    @Published var bagID: Int64 = 0
    @Published var orderSkuViewStates: [OrderSkuID: OrderSkuViewState]
    @Published var bagSubtotalText: String = ""
    @Published var bagShippingText: String = ""
    @Published var bagTaxText: String = ""
    @Published var bagMerchantName: String = ""
    @Published var merchantCurrency: String = "USD"
    @Published var bagShippingMethodLabel: String = ""
    
    
    var orderSkuViewStatesArray: [OrderSkuViewState] { return Array(orderSkuViewStates.values.sorted(by: { $0.orderSkuID < $1.orderSkuID })) }
    
    var id: Int64 { bagID }
    
    init(bagID: Int64 = 0, orderSkuViewStates: [OrderSkuID: OrderSkuViewState] = [:], bag: Bag? = nil) {
        self.bagID = bagID
        self.orderSkuViewStates = orderSkuViewStates
        if let initBag = bag {
            update(bag: initBag)
        }
    }
    
    func update(bag: Bag) {
        self.bagID = bag.id ?? 0
        self.orderID = bag.orderId ?? 0
        self.bagMerchantName = bag.merchantName ?? ""
        self.merchantCurrency = bag.currency ?? "USD"
        self.bagSubtotalText = (Double(bag.subTotal ?? 0) / 100).formatted(.currency(code: merchantCurrency))
        self.bagShippingText = (Double(bag.shippingTotal ?? 0) / 100).formatted(.currency(code: merchantCurrency))
        self.bagTaxText = (Double(bag.taxTotal ?? 0) / 100).formatted(.currency(code: merchantCurrency))
        var collectOrderSkuViewStates: [OrderSkuID: OrderSkuViewState] = [:]
        bag.skus?.forEach({ orderSku in
            if let orderSkuID = orderSku.id {
                let nextOrderSkuViewState = OrderSkuViewState(orderID: self.orderID, orderSku: orderSku)
                collectOrderSkuViewStates[orderSkuID] = nextOrderSkuViewState
            }
        })
        self.bagShippingMethodLabel = bag.shippingMethod?.label ?? ""
        self.orderSkuViewStates = collectOrderSkuViewStates
    }
    
    func orderSkuViewState(offerSkuId: OfferSkuID) -> OrderSkuViewState? {
        for next in orderSkuViewStatesArray {
            if next.offerSkuID == offerSkuId {
                return next
            }
        }
        return nil
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
    @Published var offerSkuID: OfferSkuID = 0
    
    init(orderID: OrderID, orderSku: OrderSku? = nil) {
        self.orderID = orderID
        if let initOrderSku = orderSku {
            self.update(orderSku: initOrderSku)
        }
        
    }

    
    func update(orderSku: OrderSku) {
        self.orderSkuID = orderSku.id ?? 0
        self.quantity = orderSku.quantity ?? 0
        self.offerSkuID = orderSku.skuId ?? 0
        self.skuPriceText = (Double(orderSku.price ?? 0) / 100).formatted(.currency(code: "USD"))
        
        self.name = orderSku.name ?? ""
        self.brand = orderSku.brand ?? ""
        if let urlString = orderSku.thumbnail {
            thumbURL = URL(string: "\(urlString)?width=72")
        }
    }
    
    
    
}
