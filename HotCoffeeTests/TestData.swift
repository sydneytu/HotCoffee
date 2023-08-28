//
//  TestData.swift
//  HotCoffeeTests
//
//  Created by Sydney Turner on 8/27/23.
//  Copyright © 2023 Mohammad Azam. All rights reserved.
//

import Foundation

let testCoffeeData: Data = """
{
    "name": "John Doe",
    "email": "johndoe@gmail.com",
    "type": "latte",
    "size": "medium"
},
{
    "name": "Jane Doe",
    "email": "janedoe@gmail.com",
    "type": "espresso",
    "size": "small"
}
""".data(using: .utf8)!
