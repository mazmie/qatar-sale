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
    @IBOutlet weak var categoryTbl: UITableView!
    
    var selectedCategoryDidChange: ((String) -> Void)?
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    // MARK: Functions
    private func setup() {
        setupVehicleTable()
        setupCategory()
    }
    
    private func setupVehicleTable() {
        vehicleTbl.separatorStyle = .none
        vehicleTbl.dataSource = self
        vehicleTbl.delegate = self
        vehicleTbl.register(UINib(nibName: String(describing: VehicleCell.self), bundle: nil), forCellReuseIdentifier: VehicleCell.identifier)
    }
    
    private func setupCategory() {
        categoryTbl.separatorStyle = .none
        categoryTbl.dataSource = self
        categoryTbl.delegate = self
        categoryTbl.register(UINib(nibName: String(describing: CategoryHeader.self), bundle: nil), forHeaderFooterViewReuseIdentifier: CategoryHeader.identifier)
        categoryTbl.register(UINib(nibName: String(describing: CategoryCell.self), bundle: nil), forCellReuseIdentifier: CategoryCell.identifier)
    }
}

// MARK: - UITableViewDataSource
extension PostAdCategoryController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case vehicleTbl:
            return VehiclesRepo.items.count
        case categoryTbl:
            return CategoryRepo.groups[section].items.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case vehicleTbl:
            return vehicleCell(tableView, cellForRowAt: indexPath)
        case categoryTbl:
            return categoryCell(tableView, cellForRowAt: indexPath)
        default:
            return UITableViewCell()
        }
    }
    
    func vehicleCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VehicleCell.identifier, for: indexPath) as? VehicleCell
        
        cell?.configure(model: VehiclesRepo.items[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func categoryCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.identifier, for: indexPath) as? CategoryCell
        
        cell?.configure(
            model: CategoryRepo.groups[indexPath.section].items[indexPath.row],
            delegate: self)
        
        return cell ?? UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension PostAdCategoryController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableView == categoryTbl ? CategoryRepo.groups.count : 1
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch tableView {
        case vehicleTbl:
            return nil
        case categoryTbl:
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CategoryHeader.identifier) as? CategoryHeader
            
            header?.configure(title: CategoryRepo.groups[section].title)
            
            return header
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch tableView {
        case vehicleTbl:
            return 100
        case categoryTbl:
            return 40
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch tableView {
        case vehicleTbl:
            return 0
        case categoryTbl:
            return 30
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
}

extension PostAdCategoryController: CategoryCellDelegate {
    func categoryCellTapped(_ cell: CategoryCell) {
        guard let id = cell.model?.id else { return }
        
        var indexPaths: [IndexPath] = []
        
        for gIndex in 0..<CategoryRepo.groups.count {
            for iIndex in 0..<CategoryRepo.groups[gIndex].items.count {
                if CategoryRepo.groups[gIndex].items[iIndex].id == id {
                    CategoryRepo.groups[gIndex].items[iIndex].isSelected = !CategoryRepo.groups[gIndex].items[iIndex].isSelected
                    indexPaths.append(IndexPath(row: iIndex, section: gIndex))
                    selectedCategoryDidChange?(CategoryRepo.groups[gIndex].items[iIndex].title)
                } else {
                    if CategoryRepo.groups[gIndex].items[iIndex].isSelected {
                        indexPaths.append(IndexPath(row: iIndex, section: gIndex))
                        CategoryRepo.groups[gIndex].items[iIndex].isSelected = false
                    }
                }
            }
        }
        
        if !indexPaths.isEmpty {
            categoryTbl.beginUpdates()
            categoryTbl.reloadRows(at: indexPaths, with: .fade)
            categoryTbl.endUpdates()
        }
        
    }
}
