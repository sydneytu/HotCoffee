//
//  AddOrderViewController.swift
//  HotCoffee
//
//  Created by Mohammad Azam on 5/10/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class AddOrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // controls everything that will be displayed on this VC
    private var vm = AddCoffeeOrderViewModel()

    @IBOutlet weak var tableView: UITableView!
    private var coffeeSizesSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        configureUI()
    }
    
    func configureUI() {
        coffeeSizesSegmentedControl = UISegmentedControl(items: vm.sizes)
        coffeeSizesSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(coffeeSizesSegmentedControl)
        
        NSLayoutConstraint.activate([
            coffeeSizesSegmentedControl.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
            coffeeSizesSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeTypesTableViewCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = vm.types[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
}
