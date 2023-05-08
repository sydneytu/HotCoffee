//
//  OrderViewModel.swift
//  HotCoffee
//
//  Created by Sydney Turner on 5/7/23.
//  Copyright © 2023 Mohammad Azam. All rights reserved.
//

import Foundation

// viewModel is responsible for displaying the data on the screen
// accomodates the data that will be displayed on the view (in MVC this would be in the Model)

// provides the data for entire view for the orderTableViewController
class OrderListViewModel {
    var ordersViewModel: [OrderViewModel]
    
    init() {
        self.ordersViewModel = [OrderViewModel]()
    }
    
    func orderViewModel(at index: Int) -> OrderViewModel {
        return self.ordersViewModel[index]
    }
}

// represents one coffee order
struct OrderViewModel {
    let order: Order
    
    var name: String {
        return self.order.name
    }
    
    var email: String {
        return self.order.email
    }
    
    var type: String {
        return self.order.type.rawValue.capitalized
    }
    
    var size: String {
        return self.order.size.rawValue
    }
}
