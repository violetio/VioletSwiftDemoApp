//
//  PendingAPICalls.swift
//  Checkout
//
//  Created on 5/5/23
//

import Foundation

class PendingAPICalls {
    private var pendingAPICalls = Set<APIQueueItem>()

    func enqueue(_ apiQueueItem: APIQueueItem) {
        pendingAPICalls.insert(apiQueueItem)
        apiQueueItem.baseApiCall.sinkCompleted { [weak self] completed in
            guard let self = self else { return }
            if completed {
                self.pendingAPICalls.remove(apiQueueItem)
            }
        }
    }
}
