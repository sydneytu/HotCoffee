//
//  AddCoffeeOrderViewModel.swift
//  HotCoffee
//
//  Created by Sydney Turner on 5/7/23.
//  Copyright © 2023 Mohammad Azam. All rights reserved.
//

import Foundation

struct AddCoffeeOrderViewModel {
    var name: String?
    var email: String?
    
    var types: [String] {
        return CoffeeType.allCases.map { $0.rawValue.capitalized }
    }
    
    var sizes: [String] {
        return CoffeeSize.allCases.map { $0.rawValue.capitalized }
    }
}