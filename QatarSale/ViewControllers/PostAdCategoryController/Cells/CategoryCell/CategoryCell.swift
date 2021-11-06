//
//  VehicleCellTableViewCell.swift
//  QatarSale
//
//  Created by Azmi on 6.11.2021.
//

import UIKit

protocol CategoryCellDelegate {
    func categoryCellTapped(_ cell: CategoryCell)
}

class CategoryCell: UITableViewCell {

    // MARK: Constants
    static let identifier = "categoryCell"
    
    // MARK: Outlets
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var selectedBackground: UIView!
    
    // MARK: Vars
    var model: Category?
    var delegate: CategoryCellDelegate?
    
    // MARK: Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
        selectedBackground.backgroundColor = ThemeManager.Color._0091ff.color.withAlphaComponent(0.05)
        selectedBackground.layer.borderColor = ThemeManager.Color._0091ff.color.cgColor
        selectedBackground.layer.borderWidth = 1
        selectedBackground.layer.cornerRadius = 4
        
    }

    // MARK: Functions
    func configure(
        model: Category,
        delegate: CategoryCellDelegate) {
            
        self.model = model
        self.delegate = delegate
        self.titleLbl.text = model.title
        self.selectedBackground.isHidden = true
        
        self.selectedBackground.isHidden = !model.isSelected
        self.titleLbl.textColor = model.isSelected ?
            ThemeManager.Color._0091ff.color :
            ThemeManager.Color._919191.color
    }
    
    private func setup() {
        titleLbl.setup(font: .nunito(type: .regular, size: 16), color: ._919191)
        addTapGuesture()
    }
    
    private func addTapGuesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        tapGesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapped() {
        delegate?.categoryCellTapped(self)
    }
}
