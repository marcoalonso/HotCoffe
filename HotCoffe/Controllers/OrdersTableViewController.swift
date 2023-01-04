//
//  OrdersTableViewController.swift
//  HotCoffe
//
//  Created by Marco Alonso Rodriguez on 26/12/22.
//

import Foundation
import UIKit

class OrdersTableViewController: UITableViewController, AddCoffeOrderDelegate {
    
    var orderListViewModel = OrderListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "ClientCell", bundle: nil), forCellReuseIdentifier: "OrderTableViewCell")
        populateOrders()
    }
    
    //MARK: Delegate Functions
    func addCoffeOrderViewControllerDidClose(controller: UIViewController) {
        controller.dismiss(animated: true)
    }
    
    func addCoffeOrderViewControllerDidSave(order: Order, controller: UIViewController) {
        controller.dismiss(animated: true)
        
        let orderVM = OrderViewModel(order: order)
        self.orderListViewModel.ordersViewModel.append(orderVM)
        self.tableView.insertRows(at: [IndexPath.init(row: self.orderListViewModel.ordersViewModel.count - 1, section: 0)], with: .automatic)
    }
    
    private func populateOrders() {
        
        Webservice().load(resource: Order.all) { [weak self] result in
            
            switch result {
            case .success(let orders):
                self?.orderListViewModel.ordersViewModel = orders.map(OrderViewModel.init)
                self?.tableView.reloadData()
                
                print("Debug: Orders: ")
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navC = segue.destination as? UINavigationController,
              let addCoffeeOrderVC = navC.viewControllers.first as? AddOrderViewController else {
            fatalError("Error performing segue")
        }
        addCoffeeOrderVC.delegate = self
    }
    
    //MARK: TableView Methods
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderListViewModel.ordersViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vm = self.orderListViewModel.orderViewModel(at: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath) as! ClientCell
        cell.name.text = vm.name
        cell.email.text = vm.email
        cell.type.text = vm.type
        cell.size.text = vm.size
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailOrderViewController") as! DetailOrderViewController
        vc.coffeOrder = self.orderListViewModel.orderViewModel(at: indexPath.row)
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
}
