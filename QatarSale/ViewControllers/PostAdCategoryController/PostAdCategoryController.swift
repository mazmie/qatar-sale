//
//  PostAdMainControllerViewController.swift
//  QatarSale
//
//  Created by Azmi on 6.11.2021.
//

import UIKit

class PostAdCategoryController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var searchFld: UITextField!
    @IBOutlet weak var vehicleTbl: UITableView!
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        vehicleTbl.separatorStyle = .none
        vehicleTbl.dataSource = self
        vehicleTbl.delegate = self
        vehicleTbl.register(UINib(nibName: String(describing: VehicleCell.self), bundle: nil), forCellReuseIdentifier: VehicleCell.identifier)
    }
}

// MARK: - UITableViewDataSource
extension PostAdCategoryController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VehiclesRepo.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VehicleCell.identifier, for: indexPath) as? VehicleCell
        
        cell?.configure(model: VehiclesRepo.items[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension PostAdCategoryController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
