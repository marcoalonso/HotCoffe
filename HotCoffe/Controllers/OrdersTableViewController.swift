//
//  OrdersTableViewController.swift
//  HotCoffe
//
//  Created by Marco Alonso Rodriguez on 26/12/22.
//

import Foundation
import UIKit

class OrdersTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateOrders()
    }
    
    private func populateOrders() {
        
        guard let coffeeOrdersURL = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else {
            fatalError("URL was incorrect")
        }
        
        let resource = Resource<[Order]>(url: coffeeOrdersURL)
        
        Webservice().load(resource: resource) { result in
            
            switch result {
                case .success(let orders):
                    print(orders)
                print("Debug: Orders: ")
                case .failure(let error):
                    print(error)
            }
            
        }
        
    }
}
