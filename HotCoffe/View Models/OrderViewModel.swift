//
//  OrderViewModel.swift
//  HotCoffe
//
//  Created by Marco Alonso Rodriguez on 03/01/23.
//

import Foundation

//will provide de data for TableView
class OrderListViewModel {
    
    var ordersViewModel: [OrderViewModel]
    
    init() {
        //empty array
        self.ordersViewModel = [OrderViewModel]()
    }
}

extension OrderListViewModel {
    func orderViewModel(at index : Int) -> OrderViewModel {
        return self.ordersViewModel[index]
    }
}

struct OrderViewModel {
    let order: Order
}

extension OrderViewModel {
    
    var name: String {
        return self.order.name
    }
    
    var email: String {
        return self.order.email
    }
    
//    var price: String {
//        return self.order.price
//    }
    
    var type: String {
        return self.order.type.rawValue.capitalized
    }
    
    var size: String {
        return self.order.size.rawValue.capitalized
    }
}
