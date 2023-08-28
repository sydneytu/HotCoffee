//
//  OrderViewModelTests.swift
//  HotCoffeeTests
//
//  Created by Sydney Turner on 8/25/23.
//  Copyright © 2023 Mohammad Azam. All rights reserved.
//

import XCTest
@testable import HotCoffee

final class OrdersViewModelTests: XCTestCase {
    private var ordersVM: OrdersViewModel!
    let mockWebService = MockWebSerivce()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        ordersVM = OrdersViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
