//
//  SearchField.swift
//  QatarSale
//
//  Created by Azmi on 6.11.2021.
//

import UIKit

class SearchField: UITextField {
    
    // MARK: Overrides
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += 20
        return textRect
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x -= 20
        return textRect
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    // MARK: Functions
    private func setup() {
        setup(font: .nunito(type: .bold, size: 16), color: ._252933)
        placeholder = "Search"
        backgroundColor = ThemeManager.Color.f6f6f6.color
        clipsToBounds = true
        
        layer.borderColor = ThemeManager.Color._ebebeb.cgColor
        layer.cornerRadius = 8
        layer.borderWidth = 1
        
        setupLeftView()
        setupRightView()
    }
    
    private func setupLeftView() {
        leftViewMode = UITextField.ViewMode.always
        let leftImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        leftImageView.contentMode = .scaleAspectFit
        leftImageView.image = UIImage(named: "magnifier")
        leftView = leftImageView
    }
    
    private func setupRightView() {
        rightViewMode = UITextField.ViewMode.always
        let rightImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        rightImageView.contentMode = .scaleAspectFit
        rightImageView.image = UIImage(named: "mic")
        rightView = rightImageView
    }
}
