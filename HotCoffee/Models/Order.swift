//
//  Order.swift
//  HotCoffee
//
//  Created by Sydney Turner on 5/7/23.
//  Copyright © 2023 Mohammad Azam. All rights reserved.
//

import Foundation

enum CoffeeType: String, Codable, CaseIterable {
    case cappucino
    case latte
    case espresso
    case cortado
    case frappe
}

enum CoffeeSize: String, Codable, CaseIterable {
    case small
    case medium
    case large
}


struct Order: Codable {
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeeSize
    
    init?(_ vm: AddCoffeeOrderViewModel) {
        guard let name = vm.name,
              let email = vm.email,
                let selectedType = CoffeeType(rawValue: vm.selectedType!.lowercased()),
              let selectedSize = CoffeeSize(rawValue: vm.selectedSize!.lowercased()) else {
            return nil
        }
        
        self.name = name
        self.email = email
        self.type = selectedType
        self.size = selectedSize
    }
}
