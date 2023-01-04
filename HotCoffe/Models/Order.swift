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

extension Order {
    static var all: Resource<[Order]> = {
        guard let url = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else {
            fatalError("URL was incorrect")
        }
        
        return Resource<[Order]>(url: url)
    }()
    
    static func create(vm: AddCoffeeOrderViewModel) -> Resource<Order?> {
        let order = Order(vm)
        
        guard let url = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else {
            fatalError("URL was incorrect")
        }
        
        guard let data = try? JSONEncoder().encode(order) else {
            fatalError("Error encodign order!")
        }
        
        var resource = Resource<Order?>(url: url)
        resource.httpMethod = HttpMethod.post
        resource.body = data
        
        return resource
    }
}

extension Order {
    init?(_ vm: AddCoffeeOrderViewModel) {
        guard let name = vm.name,
              let email = vm.email,
              let selectedType = CoffeType(rawValue: vm.selectedType!.lowercased()),
              let selectedSize = CoffeSize(rawValue: vm.selectedSize!.lowercased()) else {
            return nil
        }
        
        self.name  = name
        self.email = email
        self.type = selectedType
        self.size = selectedSize
        
        
    }
}
