//
//  SubmitCartRequest.swift
//  Checkout
//
//  Created on 7/20/23
//

import Violet

class SubmitCartRequest: ChannelHeadersAPICall<Order> {
    let orderId: Int64
    let body: CartSubmissionRequest?

    init(channelHeaders: ChannelHeaders, orderId: Int64, body: CartSubmissionRequest? = nil) {
        self.orderId = orderId
        self.body = body
        super.init(channelHeaders: channelHeaders)
    }

    override func send() {
        CheckoutCompletionAPI.submitCheckout(cartId: orderId,
                                             body: body) { [weak self] data, error in

            guard let weakSelf = self else { return }
            weakSelf.callIsCompleted(errorResponse: error, dataResponse: data)
        }
    }
}

