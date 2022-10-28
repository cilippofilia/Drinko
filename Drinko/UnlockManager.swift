//
//  UnlockManager.swift
//  Drinko
//
//  Created by Filippo Cilia on 19/04/2021.
//

import Combine
import StoreKit

class UnlockManager: NSObject, ObservableObject, SKPaymentTransactionObserver, SKProductsRequestDelegate {
    enum RequestState {
        case loading
        case loaded
        case failed
        case purchased
        case deferred
    }

    @Published var requestState = RequestState.loading

    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {

    }

    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {

    }
}
