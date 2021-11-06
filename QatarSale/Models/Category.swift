//
//  Category.swift
//  QatarSale
//
//  Created by Azmi on 6.11.2021.
//

import Foundation

struct CategoryGroup {
    var title: String
    var items: [Category]
}

struct Category {
    var id: Int
    var title: String
    var isSelected = false
}
