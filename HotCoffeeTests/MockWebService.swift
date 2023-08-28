//
//  MockWebService.swift
//  HotCoffeeTests
//
//  Created by Sydney Turner on 8/27/23.
//  Copyright © 2023 Mohammad Azam. All rights reserved.
//

import Foundation

class MockWebSerivce: WebService {
    func saveData(resource: Resource<Order?>) async throws -> Order {
        <#code#>
    }
    
    func loadData(from url: URL) async throws -> Data {
        try await Task.sleep(nanoseconds: UInt64.random(in: 100_000_000...500_000_000))
        return testCoffeeData
    }
    
    
}
