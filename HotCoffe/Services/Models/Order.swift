//
//  Order.swift
//  HotCoffe
//
//  Created by Marco Alonso Rodriguez on 02/01/23.
//

import Foundation

enum CoffeType: String, Codable, CaseIterable {
    case cappuccino
    case latte
    case espressino
    case cortado
    case american
}

enum CoffeSize: String , Codable , CaseIterable {
    case small
    case medium
    case large
    case jumbo
}

struct Order : Codable {
    let name: String
    let email: String
    let type: CoffeType
    let size: CoffeSize
}
