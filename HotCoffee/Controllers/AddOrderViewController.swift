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
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
    @IBAction func save() {
        let name = nameTextField.text
        let email = emailTextField.text
        
        let selectedSize = coffeeSizesSegmentedControl.titleForSegment(at: coffeeSizesSegmentedControl.selectedSegmentIndex)
        guard let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("Error in selecting coffee")
        }
        
        vm.name = name
        vm.email = email
        vm.selectedSize = selectedSize
        vm.selectedType = vm.types[indexPath.row]
        
        
    }
    
}
