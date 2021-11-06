//
//  CategoryHeader.swift
//  QatarSale
//
//  Created by Azmi on 6.11.2021.
//

import UIKit

class CategoryHeader: UITableViewHeaderFooterView {
    
    // MARK: Constants
    static let identifier = "categoryHeader"
    
    // MARK: Outlets
    @IBOutlet weak var titleLbl: UILabel!
    
    // MARK: Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    // MARK: Functions
    func configure(title: String) {
        titleLbl.text = title
    }
    
    private func setup() {
        titleLbl.setup(font: .nunito(type: .bold, size: 16), color: ._282828)
    }

}
