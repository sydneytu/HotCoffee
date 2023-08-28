//
//  OrdersTableViewController.swift
//  HotCoffee
//
//  Created by Mohammad Azam on 5/10/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class OrdersTableViewController: UITableViewController {
    // represents all the data that is needed by the tableVC
    var ordersViewModel = OrdersViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateOrders()
    }
    
    private func populateOrders() {
        guard let coffeeUrl = URL(string: "https://warp-wiry-rugby.glitch.me/orders") else {
            fatalError("URL is incorrect")
        }
        
        Task {
            do {
                let data = try await URLSession.shared.loadData(from: coffeeUrl)
                let orders = try JSONDecoder().decode([Order].self, from: data)
                self.ordersViewModel.ordersList = orders
                self.tableView.reloadData()
            }
            catch {
                print("Request failed with error: \(error.localizedDescription)")
            }
        }
        
//        let resource = Resource<[Order]>(url: coffeeUrl)
//
//        HTTPDataDownloader().load(resource: resource) { [weak self] result in
//            switch result {
//            case .success(let orders):
//                self?.ordersViewModel.ordersList = orders
//                self?.tableView.reloadData()
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navC = segue.destination as? UINavigationController,
              let addCoffeeOrderVC = navC.viewControllers.first as? AddOrderViewController
        else {
            fatalError("Error performing seque!")
        }
        
        addCoffeeOrderVC.delegate = self
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ordersViewModel.ordersList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let order = self.ordersViewModel.ordersList(at: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = order.formattedType
        content.secondaryText = order.formattedSize
        cell.contentConfiguration = content
        return cell
    }
}

extension OrdersTableViewController: AddCoffeeOrderDelegate {
    func addCoffeeOrderViewControllerDidSave(order: Order, controller: UIViewController) {
        controller.dismiss(animated: true)
        ordersViewModel.ordersList.append(order)
        tableView.insertRows(at: [IndexPath.init(row: ordersViewModel.ordersList.count - 1, section: 0)], with: .automatic)
    }
    
    func addCoffeeOrderViewControllerDidClose(controller: UIViewController) {
        controller.dismiss(animated: true)

    }
}
