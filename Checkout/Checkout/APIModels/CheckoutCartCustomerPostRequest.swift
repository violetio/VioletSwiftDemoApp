//
//  CheckoutCartPaymentPostRequest.swift
//  Checkout
//
//  Created by Alan Morford on 3/24/23.
//

import Violet

class CheckoutCartCustomerPostRequest: ChannelHeadersAPICall<Order> {

    let body: OrderCustomer
    let cartId: Int64
    
    init(channelHeaders: ChannelHeaders, cartId: Int64, guestOrderCustomer: OrderCustomer) {
        self.cartId = cartId
        self.body = guestOrderCustomer
        super.init(channelHeaders: channelHeaders)
    }

    override func send() {
        
        CheckoutCustomerAPI.applyGuestCustomerToCart(cartId: cartId,
                                                     body: body)
        { [weak self] data, error in

            guard let weakSelf = self else { return }
            weakSelf.callIsCompleted(errorResponse: error, dataResponse: data)
         
        }
        
    }
}
