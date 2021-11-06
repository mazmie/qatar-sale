//
//  VehicleCellTableViewCell.swift
//  QatarSale
//
//  Created by Azmi on 6.11.2021.
//

import UIKit

class VehicleCell: UITableViewCell {

    // MARK: Constants
    static let identifier = "vehicleCell"
    
    // MARK: Variables
    var model: Vehicle?
    
    // MARK: Outlets
    @IBOutlet weak var vehicleImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var containerView: UIView!
    
    // MARK: Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }

    // MARK: Functions
    func configure(model: Vehicle) {
        titleLbl.text = model.title
        vehicleImg.image = model.image
    }
    
    private func setup() {
        titleLbl.setup(font: .nunito(type: .bold, size: 12), color: ._282828)
        
        containerView.layer.cornerRadius = 4
        containerView.clipsToBounds = true
        containerView.backgroundColor = ThemeManager.Color._ebebeb.color
        
        imageContainerView.layer.cornerRadius = 4
        imageContainerView.clipsToBounds = true
    }
    
}
