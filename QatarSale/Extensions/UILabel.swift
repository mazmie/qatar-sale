//
//  UILabel.swift
//  QatarSale
//
//  Created by Azmi on 6.11.2021.
//

import Foundation
import UIKit

extension UILabel {
    func setup(font: ThemeManager.Font, color: ThemeManager.Color) {
        self.font = font.font
        self.textColor = color.color
    }
}
